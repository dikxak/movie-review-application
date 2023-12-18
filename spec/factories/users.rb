# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { 'johndoe11@gmail.com' }
    password { 'Password1234!@#$' }
    role { 'audience' }
  end
end
