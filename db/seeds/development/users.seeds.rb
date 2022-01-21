# frozen_string_literal: true

User.destroy_all

after do
  return unless User.count.zero?

  domain = Faker::Internet.domain_name(domain: "example")
  email = Faker::Internet.safe_email
  password = Faker::Internet.password(min_length: 8)
  
  user = User.create!(email: email,
                      password: password,
                      created_at: DateTime.now)

  puts "#{'USER'.colorize(:green)} email: #{user.email.colorize(:green)}, password: #{user.password.colorize(:green)}"
end
