# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    title { Faker::Book.title }
    position { 1 }
    content { Faker::Lorem.questions(number: 4 )}
  end
end