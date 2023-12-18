# frozen_string_literal: true

namespace :reminder do
  desc 'Send reminder email to unconfirmed users'
  task send_confirmation_email: :environment do
    unconfirmed_users = User.where(confirmed_at: nil)

    unconfirmed_users.each do |user|
      UserMailer.reminder_email(user).deliver_now
    end
  end
end
