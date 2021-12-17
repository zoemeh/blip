# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



users = []
puts "Seeding users"
user = User.create(email: "edu@edu.com", username: "edu",
                   realname: "Eduardo C.", password: "americano")
users = (1..10).map do
  User.create(email: Faker::Internet.email, username: Faker::Twitter.unique.screen_name,
              realname: Faker::Name.name, password: 'americano')
end
users.push(user)

puts "Seeding blips"
blips = (1..10).map do
  text = Faker::Twitter.status[:text]
  if rand(1..3) == 1
    text += " @#{users.sample.username}"
  end
  t = DateTime.now - (rand(5..500).minutes)
  {user_id: users.sample.id, content: text, created_at: t, updated_at: t }
end

Blip.insert_all(blips)
# Parallel.each(users) do |u|
#   (1..rand(2..100)).each do
#     u2 = users.sample
#     if u2.nil? then binding.pry end
#     u.follow! u2
#   end
# end