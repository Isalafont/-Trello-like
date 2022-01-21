require 'rails_helper'

RSpec.describe Profile, type: :model do

  # it { is_expected.to validate_length_of(:first_name) }
  # it { is_expected.to validate_length_of(:last_name) }
  # it { is_expected.to validate_length_of(:username) }
  # it { is_expected.to validate_uniqueness_of(:username) }

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
    @user_id = FactoryBot.create(:user, id: 1)
    FactoryBot.create(:profile, username: 'kenobi', user_id: @user_id)
    @user_id2 = FactoryBot.create(:user, id: 1)
    username = FactoryBot.build(:profile, username: 'kenobi', user_id: @user_id2)
    username.valid?
    expect(profile.errors[:username]).to include("has already been taken")
  end

  it 'is valid with a first name, last name, username ' do
    @user_id = FactoryBot.create(:user, id: 1)
    profile = FactoryBot.build(:profile, user_id: @user_id)
    profile.valid?
    expect(profile).to be_valid
  end

    
end
