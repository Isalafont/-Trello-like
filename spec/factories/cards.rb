# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    title { Faker::Quote.yoda }
    position { Faker::Number.digit }
    content { Faker::Lorem.questions(number: 4 )}
  end
end