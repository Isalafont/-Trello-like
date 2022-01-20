# frozen_string_literal: true

after 'development:users', 'development:lists' do
  2.times do |card|
    card = Card.create!(list_id: List.last.id, content: Faker::Lorem.questions(number:3), title: Faker::Quotes::Shakespeare.hamlet_quote)
  end
end
