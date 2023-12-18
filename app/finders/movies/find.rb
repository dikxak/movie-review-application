# frozen_string_literal: true

module Movies
  class Find
    attr_accessor :movies
    attr_reader :query, :order

    def initialize(params)
      @query = params[:query]
      @order = params[:order]
      @movies = Movie.all
    end

    def execute
      return movies if query.blank? && order.blank?

      searched_movies = search_by_title
      order_by_release_date(searched_movies)
    end

    private

    def order_by_release_date(movies)
      return movies if order.blank?

      movies.order(release_date: order)
    end

    def search_by_title
      return movies if query.blank?

      Movie.where('lower(title) LIKE ?', "%#{query.downcase}%")
    end
  end
end
