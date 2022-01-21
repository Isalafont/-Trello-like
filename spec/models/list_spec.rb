# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  it 'is invalid without a name' do
    list = List.new(name: nil)
    list.valid?
    expect(list.errors[:name]).to include("can't be blank")
  end

  it 'is valid with a name' do
    list = List.new(name: 'Backlog')
    list.valid?
    expect(list).to be_valid
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:list)).to be_valid
  end

  it 'should have_many cards' do
    expect(FactoryBot.build(:list)).to be_valid
  end
end
