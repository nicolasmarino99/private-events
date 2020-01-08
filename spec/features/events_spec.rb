require 'rails_helper'

RSpec.feature "Events", type: :feature do

  subject {User.new(name: 'User Test', email: 'user@example.com', password: 'password', password_confirmation: 'password')}
  before { subject.save }

  context 'create event' do
    before(:each) do
      visit login_path
      within('form') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'log in'
      visit new_event_path
      within('form') do
        fill_in 'Name', with: 'Event'
        fill_in 'Date', with: '12/02/2025'
        fill_in 'Location', with: 'Somewhere'
      end
    end
    
    scenario 'should be successful' do 
      within('form') do
        fill_in 'Description', with: 'description of event'
      end
      click_button 'Create event'
      expect(page).to have_content('Succesfull event creation')
    end

    scenario 'should fail' do 
      click_button 'Create event'
      expect(page).to have_content('Description can\'t be blank')
    end
  end
end
