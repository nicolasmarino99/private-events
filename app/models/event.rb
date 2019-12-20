class Event < ApplicationRecord
    validates :name, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :tag, presence: true
    validates :description, presence: true 
    
    belongs_to :creator, foreign_key: :creator_id, class_name: "User"
end
