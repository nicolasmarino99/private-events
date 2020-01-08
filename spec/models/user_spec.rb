require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new(name: 'User', email: 'user@example.com', password: 'password', password_confirmation: 'password') }

  context 'validation tests' do 
    it 'user must have a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'name should be between 2 and 50 characters' do
      user.name = 'U' * 60
      expect(user).to_not be_valid
    end

    it 'name should be between 2 and 50 characters' do
      user.name = 'U' 
      expect(user).to_not be_valid
    end

    it 'user must have a valid email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'user must have a valid email' do
      user.email = 'user.user'
      expect(user).to_not be_valid
    end

    it 'user must have a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'password should have at least 5 characters' do
      user.password = 'pass'
      expect(user).to_not be_valid
    end

    it 'password and password_confirmation should be equal' do
      user.password_confirmation = 'user'
      expect(user).to_not be_valid
    end
  end

  context 'associations tests' do
    it 'user has many events' do
      user = User.reflect_on_association(:events)
      expect(user.macro).to eq(:has_many)
    end

    it 'user has many attendances' do
      user = User.reflect_on_association(:attendances)
      expect(user.macro).to eq(:has_many)
    end

    it 'user has many attended events' do 
      user = User.reflect_on_association(:attended_events)
      expect(user.macro).to eq(:has_many)
    end
  end
end
