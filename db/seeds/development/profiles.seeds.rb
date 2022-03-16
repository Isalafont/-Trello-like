# frozen_string_literal: true
Profile.destroy_all

after 'development:users' do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.username(specifier: 3..8)
  city = Faker::Address.city
  country = Faker::Address.country
  bio = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 5)

  profile = Profile.create!(first_name: first_name,
                            last_name: last_name,
                            username: username,
                            city: city,
                            country: country,
                            bio: bio,
                            user_id: User.first.id)
  
  puts "#{'USER'.colorize(:green)}: #{User.first.id.to_s.colorize(:cyan)}, first name: #{profile.first_name.colorize(:cyan)}, last name: #{profile.last_name.colorize(:cyan)}, username: #{profile.username.colorize(:cyan)}."
end
