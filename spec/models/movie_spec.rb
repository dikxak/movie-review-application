# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Movie, type: :model) do
  subject(:user) { build(:user) }
  subject(:movie) { build(:movie, user: user) }

  describe 'Validations' do
    context 'Title' do
      it 'is valid when there is title' do
        expect(movie).to(be_valid)
      end

      it 'is not valid when there is no title' do
        movie.title = nil

        expect(movie).to_not(be_valid)
      end
    end

    context 'Genres' do
      it 'is valid when there is genres' do
        expect(movie).to(be_valid)
      end

      it 'is not valid when there is no genres' do
        movie.genres = nil

        expect(movie).to_not(be_valid)
      end
    end

    context 'Director' do
      it 'is valid when there is director' do
        expect(movie).to(be_valid)
      end

      it 'is not valid when there is no director' do
        movie.director = nil

        expect(movie).to_not(be_valid)
      end
    end

    context 'Description' do
      it 'is valid when there is description' do
        expect(movie).to(be_valid)
      end

      it 'is not valid when there is no description' do
        movie.description = nil

        expect(movie).to_not(be_valid)
      end
    end

    context 'Duration' do
      it 'is valid when there is duration' do
        expect(movie).to(be_valid)
      end

      it 'is not valid when there is no duration' do
        movie.duration = nil

        expect(movie).to_not(be_valid)
      end
    end

    context 'Release Date' do
      it 'is valid when there is release date' do
        expect(movie).to(be_valid)
      end

      it 'is not valid when there is no release date' do
        movie.release_date = nil

        expect(movie).to_not(be_valid)
      end
    end
  end
end
