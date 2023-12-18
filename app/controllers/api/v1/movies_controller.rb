# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_user
      before_action :authenticate_user!, except: %i[index show]
      before_action :authenticate_admin, only: %i[edit new]
      before_action :set_movie, only: %i[show update edit destroy]

      def index
        @movies = Movies::Find.new(params).execute

        return send_data(@movies.to_csv, filename: "movies_#{Time.now.to_i}.csv") if params[:format] == 'csv'

        return @movies if request.format.html?

        render(json: @movies, each_serialize: MovieSerializer)
      end

      def new
        @movie = Movie.new
      end

      def show
        return if request.format.html?

        if @movie
          render(json: @movie, serializer: MovieSerializer)
        else
          render(json: { status: { code: 404, message: 'Movie not found!' } })
        end
      end

      def edit; end

      def create
        @movie = @user.movies.new(movie_params)

        authorize(@movie)

        if @movie.save
          if request.format.html?
            flash[:notice] = I18n.t('flash.movie.success.add')
            redirect_to(api_v1_movies_path)
          else
            render(json: @movie, serializer: MovieSerializer)
          end
        elsif request.format.html?
          flash[:alert] = I18n.t('flash.movie.fail.add')
          render(:new)
        else
          render(json: @movie.errors, status: :unprocessable_entity)
        end
      end

      def update
        authorize(@movie)

        if @movie.update(movie_params)
          @movie.cover_image.attach(params[:movie][:cover_image]) unless @movie.cover_image.attached?
          @movie.poster_image.attach(params[:movie][:poster_image]) unless @movie.poster_image.attached?

          if request.format.html?
            flash[:notice] = I18n.t('flash.movie.success.update', title: @movie.title)
            render(:show)
          else
            render(json: @movie, serializer: MovieSerializer)
          end
        elsif request.format.html?
          flash[:alert] = I18n.t('flash.movie.fail.update', title: @movie.title)
          render(:edit)
        else
          render(errors: @movie.errors.full_messages, status: :unprocessable_entity)
        end
      end

      def destroy
        authorize(@movie)

        if @movie.destroy
          if request.format.html?
            flash[:notice] = I18n.t('flash.movie.success.delete', title: @movie.title)
            redirect_to(api_v1_movies_path)
          else
            render(json: { movie: @movie })
          end
        elsif request.format.html?
          flash[:alert] = I18n.t('flash.movie.fail.delete', title: @movie.title)
          render(:show)
        else
          render(json: { error: @movie.errors })
        end
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @movie = nil
      end

      def movie_params
        params.require(:movie).permit(:title, :genres, :director, :description, :duration, :release_date, :cover_image, :poster_image)
      end

      def set_user
        @user = current_user
      end

      def authenticate_admin
        return if current_user&.admin?

        flash[:alert] = I18n.t('flash.access_denied')
        redirect_back(fallback_location: root_path)
      end
    end
  end
end
