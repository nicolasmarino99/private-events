require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'associations tests' do
    it 'attendance belongs to attendee' do
      attendance = Attendance.reflect_on_association(:attendee)
      expect(attendance.macro).to eq(:belongs_to)
    end

    it 'attendance belongs to attended_event' do
      attendance = Attendance.reflect_on_association(:attended_event)
      expect(attendance.macro).to eq(:belongs_to)
    end
  end
end
