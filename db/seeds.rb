# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



users = []
puts "SEEDING USERS"
user = User.create(email: "edu@edu.com", username: "edu",
                   realname: "Eduardo C.", password: "americano")
users = Parallel.map((1..500), in_processes: 5) do
    {email: Faker::Internet.email, username: Faker::Twitter.unique.screen_name,
                realname: Faker::Name.name}
end
User.insert_all(users)
users = User.all

puts "SEEDING BLIPS"
blips = Parallel.map((1..10000), in_processes: 5) do
  text = Faker::Twitter.status[:text]
  if rand(1..3) == 1
    text += " @#{users.sample.username}"
  end
  t = DateTime.now - (rand(1...500).minutes)
  {user_id: users.sample.id, content: text, created_at: t, updated_at: t}
end
Blip.insert_all(blips)

puts "SEEDING FOLLOWERS"
followers = Parallel.map(users, in_processes: 5) do |u|
  (1..rand(2..500)).map do
    u2 = users.sample
    t = DateTime.now - (rand(5..500).minutes)
    {follower_id: u2.id, followee_id: u.id }
  end
end

Follower.insert_all(followers.flatten)