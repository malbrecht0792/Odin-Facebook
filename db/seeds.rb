User.create!(first_name:  "Marcel",
			 last_name:  "Albrecht",
             email: "marcel@example.com",
             password:              "foobar",
             password_confirmation: "foobar")

999.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(first_name:  first_name,
  			   last_name:  last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(100)
5.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end