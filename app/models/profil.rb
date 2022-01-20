class Profil < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :username, presence: true, length: { minimum: 3 }
  validates :username, uniqueness: { case_sensitive: false
                                     message: -> (object, data) do
                                       "Hey #{object.name}, #{data[:value]} is already taken."
                                     end
                                    }
  validates :bio, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
