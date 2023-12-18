# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :genres, :director, :description, :duration, :release_date, :cover_image_url, :poster_image_url, :aggregate_rating

  has_many :reviews, serialize: ReviewSerializer

  def cover_image_url
    object.cover_image.url if object.cover_image?
  end

  def poster_image_url
    object.poster_image.url if object.poster_image?
  end
end
