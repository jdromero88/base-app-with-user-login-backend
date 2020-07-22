# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

jose = User.create(first_name: 'Jose', last_name: 'Romero',
  email: 'jdromerov88@gmail.com', password: 'jromero')
# to upload our avatar image
jose.avatar.attach(
  io: File.open('./public/avatars/jr-test.png'),
  filename: 'jr-test.png',
  content_type: 'application/png'
)
