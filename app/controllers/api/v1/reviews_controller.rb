# frozen_string_literal: true

module Api
  module V1
    class ReviewsController < ApplicationController
      before_action :set_user
      before_action :authenticate_user!
      before_action :set_movie, only: %i[new create]

      def new
        @review = Review.new
      end

      def create
        @review = @movie.reviews.new(review_params.merge(user: @user))

        authorize(@review)

        if @review.save
          if request.format.html?
            flash[:notice] = I18n.t('flash.review.success.add')

            redirect_to(api_v1_movie_path(@movie))
          else
            render(json: @review, serializer: ReviewSerializer, status: :created)
          end
        elsif request.format.html?
          flash[:alert] = I18n.t('flash.review.fail.add')
          render(:new)
        else
          render(json: @review.errors, status: :unprocessable_entity)
        end
      end

      private

      def set_movie
        @movie = Movie.find(params[:movie_id])
      end

      def set_user
        @user = current_user
      end

      def review_params
        params.require(:review).permit(:comment, :rating)
      end
    end
  end
end
