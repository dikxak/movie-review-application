# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe('Reviews API', type: :request) do
  path '/api/v1/movies/{movie_id}/reviews' do
    parameter name: :movie_id, in: :path, type: :integer

    post('create review') do
      tags 'Reviews'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :review, in: :body, type: :object, schema: {
        type: :object,
        properties: {
          comment: { type: :string },
          rating: { type: :number }
        }
      }

      response 201, 'Review Added' do
        example 'application/json', :review_added, {
          comment: 'Great movie!',
          rating: 7.5,
          created_at: '2023-12-08T07:28:23.978Z'
        }

        run_test!
      end

      response 422, 'Unprocessable Entity' do
        example 'application/json', :unprocessable_entity, {
          rating: [
            'must be between 0 and 10'
          ]
        }

        run_test!
      end
    end
  end
end
