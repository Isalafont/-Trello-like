# frozen_string_literal: true

2.times do |list|
  List.create!({ name: Faker::Movies::StarWars.planet })
end

puts "Created #{List.count} lists named #{List.first} and #{List.last}"