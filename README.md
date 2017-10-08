<h1>The Odin Facebook is the final project in the Rails section of The Odin Project Course</h1>

It ties together all of the web development concepts learned in Rails section. 

The full project details can be found at the following link:

https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project

Features:

Postgresql database

<strong>Users must sign in to see anything except the sign in page<strong>

Trying to access a specific user through the url should redirect to the login page with the appropriate error message:

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/sign_in_required_1.png)

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/sign_in_required_2.png)

User sign-in uses the Devise gem



Users can send Friend Requests to other Users
A User must accept the Friend Request to become friends
The Friend Request shows up in the friend requests section of a User's navbar
Users can create Posts (text only)
Users can Like Posts
Users can Comment on Posts
Posts display with the post content, author, comments and likes
The Posts Index page is like the real Facebook's "Timeline" feature (Home)
Users can create a Profile with a Photo
Users can edit their timeline Photo
The User Show page contains their Profile information, photo, and Posts
Sign in should use Omniauth to allow a user to sign in with their real Facebook account
A mailer sends a welcome email when a new user signs up
The App is hosted on Heroku
