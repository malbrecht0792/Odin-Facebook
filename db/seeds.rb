require 'faker'

User.create!(first_name:  'Marcel',
             last_name:  'Albrecht',
             email: 'marcel@example.com',
             password:              'foobar',
             password_confirmation: 'foobar')

500.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n + 1}@example.com"
  password = 'password'
  User.create!(first_name:  first_name,
               last_name:  last_name,
               email:       email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(500)

users.each do |user|
  5.times do
    random_number = rand(1..3)

    content = if random_number == 1
                Faker::ChuckNorris.fact
              elsif random_number == 2
                Faker::HowIMetYourMother.quote
              else
                Faker::MostInterestingManInTheWorld.quote
              end
    user.posts.create!(content: content)
  end
end
