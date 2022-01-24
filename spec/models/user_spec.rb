# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid with a duplicate email' do
    FactoryBot.create(:user, email: 'obiwan@example.com')
    user = FactoryBot.build(:user, email: 'obiwan@example.com')
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
