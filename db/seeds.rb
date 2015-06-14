# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "u1@rl.com", password: "password", password_confirmation: "password", moderator: false)
User.create(email: "m1@rl.com", password: "password", password_confirmation: "password", moderator: true)
