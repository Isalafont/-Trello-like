# frozen_string_literal: true

List.destroy_all

after :lists do
 card = Card.create!(title: Faker::Book.title,
                     content: Faker::Lorem.questions(number:4),
                     list_id: List.first.id)
end
