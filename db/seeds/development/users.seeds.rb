# frozen_string_literal: true

after do
  return unless User.count.zero?

  domain = Faker::Internet.domain_name(domain: 'starwars')
  email = Faker::Internet.safe_email(name: 'yoda')
  password = Faker::Internet.password(min_length: 8)
  
  user = User.create!(email: email,
                      password: password,
                      created_at: DateTime.now)
  
  puts "User #{user.id} created in #{Rails.env} environment with email: #{user.email}, password: #{user.password}"
end
