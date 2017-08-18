colors = ['#0000ff', '#ff7f00', '#00ff00', '#9400d3','#ffff00']

5.times do |i|
  User.create({
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    picture: Faker::Avatar.image(i, '50x50'),
    color: colors[i % colors.size]
  })
end

ap '------------- users created'

User.all.each do |u|
  (5..10).to_a.sample.times do |i|
    Activity.create({
      latitude: 50.4414 + rand() * (50.4995 - 50.4014),
      longitude: 30.493 + rand() * (30.6920 - 30.5030),
      user_id: u.id,
      description: Faker::Matz.quote,
      color: u.color,
      created_at: Time.now - (1.day * rand()).to_i
    })
  end
end

ap '------------- activities created'
