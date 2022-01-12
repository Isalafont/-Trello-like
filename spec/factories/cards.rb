# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    name { Faker::Quote.yoda }
    position { Faker::Number.digit }
  end
end