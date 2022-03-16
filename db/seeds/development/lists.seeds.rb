# frozen_string_literal: true

after 'development:users', 'development:profiles' do
  List.create!({ name: "Closed" })
end

puts "Created #{List.count} lists."
