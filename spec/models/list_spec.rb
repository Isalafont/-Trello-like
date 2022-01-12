# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  it 'is invalid without a name' do
    list = List.new(name: nil)
    expect(list).to_not be_valid
  end

  it 'is valid with a name' do
    list = List.new(name: 'Anything')

    expect(list).to be_valid
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:list)).to be_valid
  end

  xit 'is valid with a position attribute'

  xit { should have_many(:cards) }
end
