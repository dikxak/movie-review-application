# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Review, type: :model) do
  subject(:user) { build(:user) }
  subject(:movie) { build(:movie, user: user) }
  subject(:review) { build(:review, user: user, movie: movie) }

  describe 'Validations' do
    context 'Comment' do
      it 'is valid when there is comment' do
        expect(review).to(be_valid)
      end

      it 'is not valid when there is no comment' do
        review.comment = nil

        expect(review).to_not(be_valid)
      end
    end

    context 'Rating' do
      it 'is valid when there is rating' do
        expect(review).to(be_valid)
      end

      it 'is not valid when there is no rating' do
        review.rating = nil

        expect(review).to_not(be_valid)
      end
    end
  end
end
