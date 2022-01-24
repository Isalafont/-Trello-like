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

  it 'is invalid with a duplicate username' do
    @user = FactoryBot.create(:user)
    username_1 = FactoryBot.create(:profile, username: "kenobi", user_id: @user.id)
    @user2 = FactoryBot.create(:user)
    username_2 = Profile.new(username: "kenobi", user_id: @user2.id)
    username_2.valid?
    expect(username_2.errors[:username]).to include("has already been taken")
  end

  it 'is valid with a first name, last name, username ' do
    @user = FactoryBot.create(:user)
    # profile = FactoryBot.create(:profile, user_id: @user.id)
    profile = Profile.find_by(user_id: @user.id)
    profile.valid?
    expect(profile).to be_valid
  end

end
