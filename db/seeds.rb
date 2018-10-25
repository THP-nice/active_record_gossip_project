require 'faker'

10.times do
  city = City.create!(name: Faker::Address.city, postal_code: Faker::Address.postcode)
end

10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::BackToTheFuture.quote, email: Faker::Internet.email, age: Faker::Number.between(16, 75), city_id: Faker::Number.between(City.first.id, City.last.id))
end

20.times do
  gossip = Gossip.create!(title: Faker::SiliconValley.invention, content: Faker::NewGirl.quote, user_id: Faker::Number.between(User.first.id, User.last.id))
end

10.times do
  tag = Tag.create!(title: Faker::Hipster.word)
end

# these two last commands fill up the assemblies_parts table
# give each part a random assembly
Gossip.all.each do |gossip|
  gossip.tags.push(Tag.all.sample)
  gossip.save
end

# give each assembly a random part
Tag.all.each do |tag|
  tag.gossips.push(Gossip.all.sample)
  tag.save
end

message = PrivateMessage.create!(content: Faker::NewGirl.quote, recipient: User.all.sample, sender: User.all.sample)
