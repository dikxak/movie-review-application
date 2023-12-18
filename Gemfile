# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgres as the database for Active Record
gem 'pg', '~> 1.5', '>= 1.5.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw]

  gem 'rspec-rails', '~> 6.0.0'

  gem 'factory_bot_rails'

  gem 'rswag-specs'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # enforce rails best practice with rubocop
  gem 'rubocop', '~> 1.57.0', require: false
  gem 'rubocop-performance', '~> 1.19.1', require: false
  gem 'rubocop-rails', '~> 2.22.1', require: false

  gem 'pronto', '~> 0.11.2'
  gem 'pronto-flay', '~> 0.11.1', require: false
  gem 'pronto-rubocop', '~> 0.11.5', require: false

  gem 'overcommit', '~> 0.60.0'

  gem 'pry-rails'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem 'devise', '~> 4.9'

gem 'devise-jwt'

gem 'active_model_serializers', '~> 0.10.0'

gem 'sendgrid-ruby', '~> 6.6.2'

gem 'dotenv-rails', '~> 2.8.1'

gem 'pundit', '~> 2.3'

gem 'whenever', require: false

gem 'cloudinary'

gem 'rswag'