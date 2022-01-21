# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { 'Backlog' }
    position { 1 }

    after(:create) do |list|
      create_list :card, 3, list: list
    end
  end
end
