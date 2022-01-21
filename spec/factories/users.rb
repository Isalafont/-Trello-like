# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    passsword { Faker::Name.last_name }
    created_at { DateTime.now }
  end
end
