# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password(min_length: 8) }
    created_at { DateTime.now }
  end
end
