# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe('Sign Up API', type: :request) do
  path '/api/v1/users' do
    post 'Sign Up User' do
      tags 'Sign Up'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, type: :object, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              first_name: { type: :string },
              last_name: { type: :string },
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :sting }
            }
          }
        }
      }

      response 201, 'User created' do
        example 'application/json', :user_sign_up, {
          id: 22,
          first_name: 'Michael',
          last_name: 'Clark',
          role: 'audience',
          email: 'michael.clrk@gmail.com'
        }

        run_test!
      end

      response 422, 'Unprocessable Entity' do
        example 'application/json', :unprocessable_entity, {
          errors: {
            email: [
              'is invalid'
            ]
          }
        }

        run_test!
      end
    end
  end
end
