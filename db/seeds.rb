# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
listSeed = List.create({ id: 1, name: 'This is a list', position: 1 })
cardSeed = Card.create({ id: 1, name: 'This is a card', position: 1 })
