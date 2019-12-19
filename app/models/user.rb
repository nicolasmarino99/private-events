class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { in: 5..20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 150 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }
    
    # Associations
    
    has_one_attached :profile_picture
    has_many :created_events, foreing_key: "creator_id", class_name: "Event"
end
