# frozen_string_literal: true

after 'development:users', 'development:lists' do
  2.times do |card|
    card = Card.create!(list_id: List.last.id, title: Faker::Quotes::Shakespeare.hamlet_quote)
  end
end
