require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	test "invalid signup information" do
  		get new_user_registration_path
    	assert_no_difference 'User.count' do
      		post '/users', params: { user: { name:   "",
                                        email: 		  "user@invalid",
                                        password:              "foo",
                                        password_confirmation: "bar" } }
  		end
  		assert_template 'users/new'
    	assert_select 'div#error_explanation'
   	 	assert_select 'div.field_with_errors'
	end

	# test "valid signup information" do
	# 	get new_user_registration_path
	# 	assert_difference
	# end
end
