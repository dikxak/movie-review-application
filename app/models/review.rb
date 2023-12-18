# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10, message: 'must be between 0 and 10' }
end
