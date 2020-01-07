require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create user' do
    before(:each) do
      visit new_user_path
      within('form') do
        fill_in 'Name', with: 'User Test'
        fill_in 'Password', with: 'Password'
        fill_in 'Password confirmation:', with: 'Password'
      end
    end
    
    scenario 'should be successful' do 
      within('form') do
        fill_in 'Email', with: 'User@test.com'
      end
      click_button 'Create my account'
      expect(page).to have_content('Welcome to Private Events')
    end

    scenario 'should fail' do 
      click_button 'Create my account'
      expect(page).to have_content('Email can\'t be blank')
    end
  end
  
  context 'update user' do
  
  end

  context 'destroy user' do

  end
end
