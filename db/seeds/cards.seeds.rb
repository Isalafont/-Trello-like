# frozen_string_literal: true

after :lists do
  card = Card.create!(name: Faker::Quote.yoda, list_id: List.first.id )
end