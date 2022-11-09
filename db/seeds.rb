require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.most_interesting_man_in_the_world,
    email: "#{Faker::Name.first_name.downcase}-#{Faker::Name.last_name.downcase}@yopmail.com",
  )
end

10.times do
    Event.create(
        start_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 30),
        duration: 5 * rand(1..24),
        title: Faker::Music.album,
        description: Faker::Quote.most_interesting_man_in_the_world,
        price: rand(1..1000),
        location: Faker::Address.city,
        admin: User.all.sample
    )
end

50.times do
    Attendance.create(
        user: User.all.sample,
        event: Event.all.sample
    )
end