# frozen_string_literal: true

class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  
  validates :email, uniqueness: true
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  after_create :init_profile
  
  private
  
  def init_profile
    self.build_profile.save(validate: false)
  end
end
