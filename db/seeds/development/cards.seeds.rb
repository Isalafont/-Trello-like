# frozen_string_literal: true

after 'development:users', 'development:lists' do
  2.times do |card|
    card = Card.create!(list_id: List.last.id, name: Faker::Quote.yoda )
  end

  puts "Created #{Card.count} cards into #{List.last.name} list with position #{List.last.position}"
end