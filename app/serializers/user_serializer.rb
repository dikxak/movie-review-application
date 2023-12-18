# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  include Constants

  attributes :id, :first_name, :last_name, :role, :email

  has_many :movies, if: :admin_user?
  has_many :reviews, if: :audience_user?

  def admin_user?
    current_user && current_user.role == ADMIN_STRING
  end

  def audience_user?
    current_user && current_user.role == AUDIENCE_STRING
  end
end
