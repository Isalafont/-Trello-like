FactoryBot.define do
  factory :profil do
    first_name { "MyString" }
    last_name { "MyString" }
    username { "MyString" }
    town { "MyString" }
    country { "MyString" }
    bio { "MyText" }
    user { nil }
  end
end
