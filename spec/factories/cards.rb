# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    list

    before(:create) do |card|
      create(:list)
    end

    title { Faker::Book.title }
    position { Faker::Number.digit }
    content { Faker::Lorem.questions(number: 4 )}
    list_id { list.id }
  end
end