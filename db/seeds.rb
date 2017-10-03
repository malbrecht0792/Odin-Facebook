require 'faker'

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
               email:       email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(100)

users.each { |user|

  5.times do
    random_number = rand(1..3)

    if random_number == 1 
      content = Faker::ChuckNorris.fact
      user.posts.create!(content: content)
    elsif random_number == 2
      content = Faker::HowIMetYourMother.quote
      user.posts.create!(content: content)
    else
      content = Faker::MostInterestingManInTheWorld.quote
      user.posts.create!(content: content)
    end
  end

}

