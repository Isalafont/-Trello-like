# frozen_string_literal: true

after :lists do
 card = Card.create!(title: Faker::Quotes::Shakespeare.hamlet_quote, list_id: List.first.id)
end
