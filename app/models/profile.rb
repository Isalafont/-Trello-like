# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :username, presence: true, length: { minimum: 3 }
  validates :username, uniqueness: { case_sensitive: false }
  validates :bio, length: { maximum: 500,
                            too_long: "%{count} characters is the maximum allowed" }
end