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
    last_name: "テスト",
    first_name: "太郎",
    phone_number: "03033333333",
    prefecture_id: "5",
    email: "test@gmail.com",
    password: "111111",
    birthday: "1990/1/1",
    introduction: "趣味は旅行です！",
  ]
)