# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'is invalid without a title' do
    card = FactoryBot.build(:card, title: nil)
    card.valid?
    expect(card.errors[:title]).to include("can't be blank")
  end

  it 'is valid with a title' do
    card = FactoryBot.build(:card, title: 'Backlog')
    card.valid?
    expect(card).to be_valid
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:card)).to be_valid
  end
end
