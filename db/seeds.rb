require 'faker'

def city_table
  10.times do
    city = City.create!(name: Faker::Address.city,
      postal_code: Faker::Address.postcode)
  end
end

def user_table
  10.times do
    user = User.create!(first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::BackToTheFuture.quote,
      email: Faker::Internet.email,
      age: Faker::Number.between(16, 75),
      city_id: Faker::Number.between(City.first.id, City.last.id))
  end
end

def gossip_table
  20.times do
    gossip = Gossip.create!(title: Faker::SiliconValley.invention,
      content: Faker::NewGirl.quote,
      user_id: Faker::Number.between(User.first.id, User.last.id))
  end
end

def tag_table
  10.times do
    tag = Tag.create!(title: Faker::Hipster.word)
  end
end

def gossips_tags_table
  
  # these two last commands fill up the gossips_tags table
  # give each gossip a random tag
  Gossip.all.each do |gossip|
    gossip.tags.push(Tag.all.sample)
    gossip.save
  end

  # give each tag a random gossip
  Tag.all.each do |tag|
    tag.gossips.push(Gossip.all.sample)
    tag.save
  end
end

def sender(int)
  
  i = 0
  rec = User.all.sample
  quote = Faker::NewGirl.quote

  def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end

  if int.is_number?
    while i < int
      PrivateMessage.create!(content: quote,
        recipient: User.all.sample, sender: rec)
      i += 1
    end
  end
end

def perform
  city_table
  user_table
  gossip_table
  tag_table
  gossips_tags_table
  sender(5)
end

perform