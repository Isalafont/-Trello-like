# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
listSeed = List.create({ name: Faker::Movies::StarWars.planet, position: Faker::Number.digit })
cardSeed = List.first.cards.create({ name: Faker::Quote.yoda, position: Faker::Number.digit })
