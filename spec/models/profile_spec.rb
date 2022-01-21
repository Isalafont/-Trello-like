require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    user = create(:user)
  end
  
  subject { create(:profile) }

  it {is_exprected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_length_of(:first_name) }
  it { is_expected.to validate_length_of(:last_name) }
  it { is_expected.to validate_length_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }

  # it 'is invalid without a first_name' do
  #   profile = Profile.new(first_name: nil)
  #   expect(profile).to_not be_valid
  # end

  # it 'is valid with a first_name' do
  #   profile = Profile.new(first_name: )
  # end

    
end
