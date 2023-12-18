# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    comment { 'Best movie to watch. All time favorite!' }
    rating { 8 }
  end
end
