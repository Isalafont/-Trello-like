# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'is invalid without a first_name' do
    profile = FactoryBot.build(:profile, first_name: nil)
    profile.valid?
    expect(profile.errors[:first_name]).to include("can't be blank")
  end

  it 'is invalid without a last_name' do
    profile = FactoryBot.build(:profile, last_name: nil)
    profile.valid?
    expect(profile.errors[:last_name]).to include("can't be blank")
  end

  it 'is invalid without a username' do
    profile = FactoryBot.build(:profile, username: nil)
    profile.valid?
    expect(profile.errors[:username]).to include("can't be blank")
  end

  it 'is invalid with a duplicate username and it is non case sensitive' do
    @user = FactoryBot.create(:user)
    username_1 = FactoryBot.create(:profile, username: "kenobi", user_id: @user.id)
    @user2 = FactoryBot.build(:user)
    username_2 = FactoryBot.build(:profile, username: "KenoBi", user_id: @user2.id)
    username_2.valid?
    expect(username_2.errors[:username]).to include("has already been taken")
  end

  it 'is valid with a first name, last name, username ' do
    profile = FactoryBot.build(:user)
    profile.valid?
    expect(profile).to be_valid
  end

  it 'is invalid if username is less than 3 letters' do
    profile = FactoryBot.build(:profile, username: "El")
    profile.valid?
    expect(profile.errors[:username]).to include("is too short (minimum is 3 characters)")
  end
end
