# frozen_string_literal: true

after "development:users" do
  List.create!({ name: Faker::Movies::StarWars.planet })
end

puts "Created #{List.count} lists"