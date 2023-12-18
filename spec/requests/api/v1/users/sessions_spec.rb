# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe('Login API', type: :request) do
  path '/api/v1/users/sign_in' do
    post 'Login User' do
      tags 'Login'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, type: :object, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        }
      }

      response 201, 'User logged in' do
        example 'application/json', :audience_login, {
          id: 2,
          first_name: 'John',
          last_name: 'Doe',
          role: 'audience',
          reviews: [
            {
              comment: 'Great movie!',
              rating: 8.0,
              created_at: '2023-12-11T11:18:41.040Z'
            },
            {
              comment: 'Great superhero movie ever made!',
              rating: 8.5,
              created_at: '2023-12-12T05:38:15.907Z'
            }
          ]
        }

        example 'application/json', :admin_login, {
          id: 2,
          first_name: 'Jack',
          last_name: 'Smith',
          role: 'admin',
          movies: [
            {
              id: 33,
              title: 'Shutter Island',
              genres: 'Thriller, Mystery',
              director: 'Martin Scorsese',
              description: 'Teddy Daniels and Chuck Aule, two US marshals, are sent to an asylum on a remote island in order to investigate the disappearance of a patient, where Teddy uncovers a shocking truth about the place.',
              duration: 130,
              release_date: '2010-02-19',
              cover_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/elwm3gqnov748g9gyxho7y0e4kos.jpg',
              poster_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/6ln081saovxbvb27ayfx3p8hk57b.jpeg',
              aggregate_rating: 0
            },

            {
              id: 29,
              title: 'The Avengers',
              genres: 'Action, Fantasy',
              director: 'Joss Whedon',
              description: 'S.H.I.E.L.D. leader Nick Fury is compelled to launch the Avengers programme when Loki poses a threat to planet Earth. But the superheroes must learn to work together if they are to stop him in time.',
              duration: 143,
              release_date: '2012-05-04',
              cover_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/jhksjdsknq0np3czwouiruo2u4wz.jpg',
              poster_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/4ww2skfnhc1gvi5lfm4gkuzccsg8.jpg',
              aggregate_rating: 7.5
            }
          ]

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
