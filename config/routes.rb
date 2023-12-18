# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users, path: 'api/v1/users', controllers: {
    registrations: 'api/v1/users/registrations',
    sessions: 'api/v1/users/sessions',
    confirmations: 'api/v1/users/confirmations'
  }

  namespace :api do
    namespace :v1 do
      resources :movies do
        resources :reviews
      end
    end
  end

  root 'api/v1/movies#index'
end
