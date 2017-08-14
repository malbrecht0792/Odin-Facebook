require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  	include Devise::Test::IntegrationHelpers

  	def setup
		@user = users(:marcel)
	end

  	test 'login in with invalid info' do 
  		get new_user_session_path
  		assert_template 'devise/sessions/new'
  		post new_user_session_path, params: { session: { email: "", 
  													  password: ""}}
  		assert_template 'devise/sessions/new'
  		assert_not flash.empty?
  	end

  	test 'login with valid info' do
  		get new_user_session_path
  		assert_template 'devise/sessions/new'
  		post new_user_session_path, params: { session: { email: @user.email,
	                                          password: 'password' } }
  		assert_template 'devise/sessions/new'
  	end
end
