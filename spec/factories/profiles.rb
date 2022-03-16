# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.username(specifier: 3..8) }
    city { Faker::Address.city }
    country { Faker::Address.country }
    bio { Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 5) }
  end
end
