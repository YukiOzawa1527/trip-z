# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email: "app_admin@gmail.com",
  password: "999999"
)

User.create!(
  [
    name: "テスト次郎",
    phone_number: "05055555555",
    prefecture_id: 3,
    email: "testjiro@gmail.com",
    password: "333333",
    birthday: "1990/3/31",
    introduction: "趣味は旅行です",
  ]
)