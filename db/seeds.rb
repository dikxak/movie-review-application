# frozen_string_literal: true

# rubocop:disable Layout/LineLength

admin1 = User.create!(first_name: 'First', last_name: 'Admin', email: 'admin1@gmail.com', role: 0, password: 'password',
                      password_confirmation: 'password'
)

admin2 = User.create!(first_name: 'Second', last_name: 'Admin', email: 'admin2@gmail.com', role: 0, password: 'password',
                      password_confirmation: 'password'
)

if admin1.persisted? && admin2.persisted?
  Rails.logger.debug('Two admin users created successfully.')
else
  Rails.logger.debug { "Admin1 creation failed: #{admin1.errors.full_messages.join(', ')}" } if admin1.errors.any?
  Rails.logger.debug { "Admin2 creation failed: #{admin2.errors.full_messages.join(', ')}" } if admin2.errors.any?
end

Movie.create!([
  {
    user_id: 2,
    title: 'The Godfather',
    genres: 'Crime',
    director: 'Francis Ford Coppola',
    description: 'Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son, Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger.',
    duration: 175,
    release_date: '1972-09-11'
  },
  {
    user_id: 3,
    title: 'Dark Knight',
    genres: 'Action, Adventure',
    director: 'Christopher Nolan',
    description: 'Batman has a new foe, the Joker, who is an accomplished criminal hell-bent on decimating Gotham City. Together with Gordon and Harvey Dent, Batman struggles to thwart the Joker before it is too late.',
    duration: 152,
    release_date: '2008-07-18'
  }
]
             )

# rubocop:enable Layout/LineLength
