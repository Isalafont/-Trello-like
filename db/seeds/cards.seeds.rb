# frozen_string_literal: true

after :lists do
 card = Card.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, content: Faker::Lorem.questions(number:4), list_id: List.first.id)
end
