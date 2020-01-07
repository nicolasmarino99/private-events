require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  
  subject {User.new(name: 'User Test', email: 'user@example.com', password: 'password', password_confirmation: 'password')}
  before { subject.save }

  context 'Create session' do
       
    before(:each) do
      visit login_path
      within('form') do
        fill_in 'Email', with: 'user@example.com'
        
      end
    end
    scenario 'Should be successful' do
      within('form') do  
        fill_in 'Password', with: 'password'
      end
      click_button 'log in'
      expect(page).to have_content('Welcome back :)')
    end

    scenario 'Should fail' do 
      click_button 'log in'
      expect(page).to have_content('Invalid email or password combination')
    end
  
  end
  

  context 'destroy session' do
    
    scenario 'Should be successful' do
      visit login_path
      within('form') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'log in'
      click_link 'Log out'
      expect(page).to have_content('Log in')
    end  
  end
end
