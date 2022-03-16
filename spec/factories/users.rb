# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email(domain: "example.com") }
    password { Faker::Internet.password(min_length: 8) }

    after(:create) do |user|
      create_list :profile, 1, user: user
    end
  end
end
