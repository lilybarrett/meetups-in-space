require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
20.times do
  Meetup.create(name: Faker::Company.name, description: Faker::Lorem.paragraph, location: Faker::Address.city, creator: Faker::Name.name)
end

100.times do |n|
  User.create(provider: "Github", uid: n, username:Faker::Internet.user_name, email: Faker::Internet.email, avatar_url: Faker::Avatar.image)
end

# 100.times do |n|
#   MembersList.create(
#   {meetup_id: rand(1..20), user_id: n}
#   )
# end

meetups = [
  {meetup_id:"4", user_id: "3"},
  {meetup_id:"4", user_id: "22"},
  {meetup_id:"4", user_id: "19"},
  {meetup_id:"19", user_id: "5"},
  {meetup_id:"11", user_id: "12"},
  {meetup_id:"5", user_id: "49"},
  {meetup_id:"7", user_id: "90"},
  {meetup_id:"15", user_id: "55"},
  {meetup_id:"2", user_id: "60"},
  {meetup_id:"1", user_id: "70"}
]

meetups.each do |info|
  MembersList.create(info)
end
