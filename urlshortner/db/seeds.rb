# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ShortenedUrl.destroy_all
Visit.destroy_all

user1  = User.create!(email: "0@gamil.com")
user2  = User.create!(email: "1@gamil.com")
user3  = User.create!(email: "2@gamil.com")
user4  = User.create!(email: "3@gamil.com")

short1 = ShortenedUrl.random_code(user1.id, "www.google.com")
short2 = ShortenedUrl.random_code(user1.id, "www.yahoo.com")
short3 = ShortenedUrl.random_code(user1.id, "www.askjeeves.com")

Visit.record_visit!(user1.id, short1.id)
Visit.record_visit!(user2.id, short1.id)
Visit.record_visit!(user2.id, short1.id)
Visit.record_visit!(user3.id, short2.id)
Visit.record_visit!(user4.id, short2.id)
Visit.record_visit!(user4.id, short2.id)
Visit.record_visit!(user1.id, short2.id)
