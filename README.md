<h1>The Odin Facebook</h1>

This is the final project in the Rails section of The Odin Project Course. It ties together all of the web development concepts learned in Rails section. 

* The full project details can be found here:

https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project

- The application is hosted on Heroku here:

https://odin-facebook-2017.herokuapp.com

<h2>Features:</h2>

<strong>* Postgresql database</strong>

*<strong>- Users must sign in to see anything except the sign in page</strong>

Trying to access a specific user through the url should redirect to the login page with the appropriate error message:

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/sign_in_required_1.png)

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/sign_in_required_2.png)

*<strong>User sign-in uses the Devise gem</strong>

<pre><code>devise :database_authenticatable, :registerable,
   :recoverable, :trackable, :validatable, 
   :omniauthable, :omniauth_providers => [:facebook]
</code></pre>

*<strong>Users can send friend requests to other users</strong>

The user visits another user's profile page, and clicks on the "Add Friend" button

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/profile_page_add_friend.png)

The button then displays as "Request Sent"

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/profile_page_request_sent.png)

*<strong>The friend request shows up in the friend requests section of a user's navbar</strong>

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/friend_requests.png)

*<strong>A User must accept the friend request to become friends</strong>

Once the user that was sent the friend request accepts the friend request, the two users become friends. They each see each other's posts on the Timeline/Home page.

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/timeline.png)

*<strong>Users can create posts (text only)</strong>

The user uses the text field to submit their post 

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/new_post.png)

Once the post is submitted, it appears on the user's profile page

*<strong>Posts display with the post content, author, comments and likes</strong>

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/first_post.png)

*<strong>Users can "like" posts</strong>

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/like.png)

*<strong>Users can comment on posts</strong>

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/comment.png)

<strong>The Posts Index page is like the real Facebook's "Timeline" feature (Home)</strong>

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/timeline.png)

*<strong>Users can edit their timeline photo</strong>

A user can select "Account -> Edit Profile" to change their timeline photo

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/edit_profile.png)

Once they upload a new photo, they will be redirected to their profile page, displaying the updated timeline photo

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/updated_profile.png)

*<strong>The user show page contains their profile information, photo, and posts</strong>

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/profile_1.png)

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/profile_2.png)

*<strong>Sign in should use Omniauth to allow a user to sign in with their real Facebook account</strong>

![alt text](https://raw.githubusercontent.com/malbrecht0792/Odin-Facebook/master/app/assets/images/screenshots/sign_in_omniauth.png)

*<strong>A mailer sends a welcome email when a new user signs up</strong>

*<strong>The App is hosted on Heroku</strong>
