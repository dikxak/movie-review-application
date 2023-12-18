# frozen_string_literal: true

class ReviewSerializer < ActiveModel::Serializer
  attributes :comment, :rating, :created_at
end
