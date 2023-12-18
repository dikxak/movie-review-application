# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  subject(:user) { build(:user) }

  describe 'Validations' do
    context 'First Name' do
      it 'is valid when there is first name' do
        expect(user).to(be_valid)
      end

      it 'is not valid when there is no first name' do
        user.first_name = nil

        expect(user).to_not(be_valid)
      end
    end

    context 'Last Name' do
      it 'is valid when there is last name' do
        expect(user).to(be_valid)
      end

      it 'is not valid when there is no last name' do
        user.last_name = nil

        expect(user).to_not(be_valid)
      end
    end

    context 'Email' do
      it 'is valid when there is email' do
        expect(user).to(be_valid)
      end

      it 'is not valid when there is no email' do
        user.email = nil

        expect(user).to_not(be_valid)
      end
    end

    context 'Password' do
      it 'is valid when there is password' do
        expect(user).to(be_valid)
      end

      it 'is not valid when there is no password' do
        user.password = nil

        expect(user).to_not(be_valid)
      end

      it 'is not valid when password length is less than eight' do
        user.password = 'Pass11!'

        expect(user).to_not(be_valid)
      end

      it 'is valid when password requirement is met' do
        user.password = 'Pass11!(0)'

        expect(user).to(be_valid)
      end
    end

    context 'Role' do
      it 'is valid when there is role' do
        expect(user).to(be_valid)
      end

      it 'is not valid when there is no role' do
        user.role = nil

        expect(user).to_not(be_valid)
      end
    end
  end
end
