class Event < ApplicationRecord
    validates :name, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :tag, presence: true
    validates :description, presence: true 
    
    # Associations

    belongs_to :creator, foreign_key: :creator_id, class_name: "User"
    has_many :attendances, foreign_key: :attended_event_id
    has_many :attendees, through: :attendances, source: :attendee

    # Scopes

    scope :upcoming, -> { where('date > :current_time', current_time: DateTime.now) }
    scope :past, -> { where('date < :current_time', current_time: DateTime.now) } 
end
