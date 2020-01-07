require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) {Event.new(name: "name", date: Time.now, location: "location", tag: "music", description: "some description")}

  context 'Validations tests' do
    it 'Event must have a name' do
      event.name = nil
      expect(event).to_not be_valid
    end

    it 'Event must have a date' do
      event.date = nil
      expect(event).to_not be_valid
    end

    it 'Event must have a location' do
      event.location = nil
      expect(event).to_not be_valid
    end

    it 'Event must have a tag' do
      event.tag = nil
      expect(event).to_not be_valid
    end
    it 'Event must have a description' do
      event.description = nil
      expect(event).to_not be_valid
    end
    
  end
  
  context 'Associations tests' do
    it "has many attendances" do
      event = Event.reflect_on_association(:attendances)
      expect(event.macro).to eq(:has_many)
    end
    it "has many attendees" do
      event = Event.reflect_on_association(:attendees)
      expect(event.macro).to eq(:has_many)
    end
    it "Belongs to creator" do
      event = Event.reflect_on_association(:creator)
      expect(event.macro).to eq(:belongs_to)
    end
  end
end
