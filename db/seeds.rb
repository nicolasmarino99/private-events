User.create!(name:  "John",
    email: "john@example.com",
    password:              "123456",
    password_confirmation: "123456")

19.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
        email: email,
        password:              password,
        password_confirmation: password)
end

users = User.all
users.each do |user|

    user.events.create!(name: "Party",
                date: Time.now + 1.year,
                location: "Somewhere",
                description: "This is a party",
                tag: "Music")

    1.times do |n|
        name = Faker::Name.name
        date = Time.now + 1.year
        location = "Somewhere"
        description = "This is an event"
        tag = "Music"
        user.events.create!(name: name,
                    date: date,
                    location: location,
                    description: description,
                    tag: tag)

    end
end