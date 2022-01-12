# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { Faker::Movies::StarWars.planet }
    position { Faker::Number.digit }

    after(:create) do |list|
      create_list :card, 3, list: list
    end
  end
end
