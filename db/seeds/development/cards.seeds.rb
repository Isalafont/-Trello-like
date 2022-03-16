# frozen_string_literal: true

Card.destroy_all

after 'development:users', 'development:profiles', 'development:lists' do
  2.times do |card|
    card = Card.create!(list_id: List.last.id,
                        content: Faker::Lorem.question,
                        title: Faker::Quotes::Shakespeare.hamlet_quote)
  end
end

puts "Created #{Card.count} cards."
