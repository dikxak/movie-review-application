# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'The Shawshank Redemption' }
    genres { 'Crime, Drama' }
    director { 'Frank Darabont' }
    description { 'Andy Dufresne, a successful banker, is arrested for the murders of his wife and her lover, and is sentenced to life imprisonment at the Shawshank prison. He becomes the most unconventional prisoner.' }
    duration { 142 }
    release_date { '1944-10-14' }
  end
end
