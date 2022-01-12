# frozen_string_literal: true

3.times do |card|
  card = Card.create!(list_id: List.first.id, name: Faker::Quote.yoda )
end

puts "Created #{Card.count} cards into #{List.first.name} list"