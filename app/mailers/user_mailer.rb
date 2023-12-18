# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'dikshak@truemark.com.np'

  def confirmation_instructions
    @user = User.last

    Devise::Mailer.confirmation_instructions(@user, {})

    mail(to: @user.email, subject: 'Confirmation Instruction')
  end

  def reminder_email(user)
    @user = user
    @token = user.confirmation_token

    mail(to: @user.email, subject: 'Reminder: Confirm Your Account')
  end
end
