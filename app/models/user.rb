# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { in: 2..50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 150 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }

  # Associations

  has_one_attached :profile_picture
  has_many :events, foreign_key: 'creator_id'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, source: :attended_event
end
