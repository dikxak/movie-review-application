# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_one_attached :cover_image do |attachable|
    attachable.variant(:thumb, resize_to_limit: [720, 720])
  end
  has_one_attached :poster_image do |attachable|
    attachable.variant(:thumb, resize_to_limit: [720, 720])
  end

  validates :title, presence: true, uniqueness: true
  validates :genres, presence: true
  validates :director, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :release_date, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: 'should be in the format YYYY-MM-DD' }

  def aggregate_rating
    return 0 if reviews.empty?

    reviews.average(:rating).round(2)
  end

  def self.to_csv
    all_movies = all

    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Title', 'Director', 'Release Date', 'Aggregate Rating']

      all_movies.each do |movie|
        release_date = movie.release_date.strftime('%d %b, %Y')
        aggregate_rating = movie.aggregate_rating.zero? ? 'Not Rated' : movie.aggregate_rating

        csv << [movie.id, movie.title, movie.director, release_date, aggregate_rating]
      end
    end
  end
end
