# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe('Movies API', type: :request) do
  path '/api/v1/movies' do
    get 'Retrieves All Movies' do
      tags 'Movies'
      produces 'application/json'

      response 200, 'List of movies' do
        example 'application/json', :all_movies, [
          {
            id: 32,
            title: 'The Prestige',
            genres: 'Thriller, Sci-fi',
            director: 'Christopher Nolan',
            description: 'Two friends and fellow magicians become bitter enemies after a sudden tragedy. As they devote themselves to this rivalry, they make sacrifices that bring them fame but, with terrible consequences.',
            duration: 130,
            release_date: '2006-10-20',
            cover_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/49pbiiw2z85zpyivpodadmvcaojw.jpg',
            poster_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/mcnwzybp43s7z50urxu73abunnvd.jpeg',
            aggregate_rating: 7,
            reviews: [
              {
                comment: 'Best movie.',
                rating: 7.0,
                created_at: '2023-12-08T07:28:15.986Z'
              }
            ]
          },
          {
            id: 39,
            title: 'Title 10',
            genres: 'Genres',
            director: 'Director',
            description: 'Desc',
            duration: 121,
            release_date: '2012-10-11',
            cover_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/n7r3w1y8dygvdo51pdwmmmbbans2.jpg',
            poster_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/icpehqojztizkuswyfwiyde7pfe1.jpg',
            aggregate_rating: 6.5,
            reviews: [
              {
                comment: 'Average movie.',
                rating: 6.5,
                created_at: '2023-12-08T07:28:23.978Z'
              }
            ]
          }
        ]

        run_test!
      end
    end

    post 'Creates a movie' do
      tags 'Movies'
      consumes 'multipart/form-data'
      produces 'application/json'
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          genres: { type: :string },
          director: { type: :string },
          description: { type: :string },
          duration: { type: :integer },
          release_date: { type: :string },
          cover_image: { type: :string, format: :binary },
          poster_image: { type: :string, format: :binary }
        },
        required: %w[title genres director description duration release_date]
      }

      response 201, 'Movie Created' do
        example 'application/json', :movie_created, {
          id: 7,
          title: 'The Avengers',
          genres: 'Action, Fantasy',
          director: 'Joss Whedon',
          description: 'S.H.I.E.L.D. leader Nick Fury is compelled to launch the Avengers programme when Loki poses a threat to planet Earth. But the superheroes must learn to work together if they are to stop him in time.',
          duration: 143,
          release_date: '2012-05-04',
          cover_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/jhksjdsknq0np3czwouiruo2u4wz.jpg',
          poster_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/4ww2skfnhc1gvi5lfm4gkuzccsg8.jpg',
          aggregate_rating: 7.75,
          reviews: []
        }

        run_test!
      end

      response 422, 'Unprocessable Entity' do
        example 'application/json', :unprocessable_entity, {
          errors: {
            status: 422,
            message: 'Invalid operation'
          }
        }

        run_test!
      end

      response 401, 'Unauthorized' do
        example 'application/json', :user_unauthorized, {
          error: 'You need to sign in or sign up before continuing.'
        }
        run_test!
      end
    end
  end

  path '/api/v1/movies/{id}' do
    get 'Retrieves a movie' do
      tags 'Movies'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response 200, 'Movie Details' do
        example 'application/json', :movie_found, {
          id: 1,
          title: 'Shutter Island',
          genres: 'Thriller, Mystery',
          director: 'Martin Scorsese',
          description: 'Teddy Daniels and Chuck Aule, two US marshals, are sent to an asylum on a remote island in order to investigate the disappearance of a patient, where Teddy uncovers a shocking truth about the place.',
          duration: 130,
          release_date: '2010-02-19',
          cover_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/elwm3gqnov748g9gyxho7y0e4kos.jpg',
          poster_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/6ln081saovxbvb27ayfx3p8hk57b.jpeg',
          aggregate_rating: 8.78
        }

        run_test!
      end

      response 401, 'Unauthorized' do
        example 'application/json', :user_unauthorized, {
          status: {
            code: 401,
            message: 'User unauthorized!'
          }
        }

        run_test!
      end

      response 404, 'Movie not found' do
        example 'application/json', :movie_not_found, {
          status: {
            code: 404,
            message: 'Movie not found!'
          }
        }

        run_test!
      end
    end

    patch 'Updates a movie' do
      tags 'Movies'
      consumes 'multipart/form-data'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          genres: { type: :string },
          director: { type: :string },
          description: { type: :string },
          duration: { type: :integer },
          release_date: { type: :string },
          cover_image: { type: :string, format: :binary },
          poster_image: { type: :string, format: :binary }
        },
        required: %w[title genres director description duration release_date]
      }

      response 200, 'Movie Updated' do
        example 'application/json', :movie_updated, {
          id: 32,
          title: 'The Prestige',
          genres: 'Thriller, Sci-fi',
          director: 'Christopher Nolan',
          description: 'Two friends and fellow magicians become bitter enemies after a sudden tragedy. As they devote themselves to this rivalry, they make sacrifices that bring them fame but, with terrible consequences.',
          duration: 130,
          release_date: '2006-10-20',
          cover_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/49pbiiw2z85zpyivpodadmvcaojw.jpg',
          poster_image_url: 'https://res.cloudinary.com/dyrohwmry/image/upload/mcnwzybp43s7z50urxu73abunnvd.jpeg',
          aggregate_rating: 0,
          reviews: [
            {
              comment: 'Best crime movie ever made.',
              rating: 10.0,
              created_at: '2023-12-07T07:26:32.563Z'
            },
            {
              comment: 'Best movie.',
              rating: 7.0,
              created_at: '2023-12-08T07:28:15.986Z'
            }
          ]
        }

        run_test!
      end

      response 422, 'Unprocessable Entity' do
        example 'application/json', :unprocessable_entity, {
          errors: {
            status: 422,
            message: 'Invalid operation'
          }
        }

        run_test!
      end

      response 401, 'Unauthorized' do
        example 'application/json', :user_unauthorized, {
          error: 'You need to sign in or sign up before continuing.'
        }
        run_test!
      end
    end
  end
end
