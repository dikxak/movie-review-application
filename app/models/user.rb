# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :jwt_authenticatable, jwt_revocation_strategy: self

  after_initialize :set_default_user_role, if: :new_record?

  validate :password_complexity

  include Constants

  has_many :movies, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum role: {
    admin: ADMIN,
    audience: AUDIENCE
  }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  private

  def set_default_user_role
    self.role ||= AUDIENCE
  end

  def password_complexity
    return if password.blank? || password =~ /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/

    errors.add(:password,
               'Length should be minimum 8 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
              )
  end
end
