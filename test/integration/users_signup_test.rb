require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	test "invalid signup information" do
  		get new_user_registration_path
    	assert_no_difference 'User.count' do
      		post '/users', params: { user: { email:   "user@invalid",
                                        password:              "foo",
                                        password_confirmation: "bar" } }
  		end
  		assert_template 'devise/registrations/new'
    	assert_select 'div#error_explanation'
   	 	assert_select 'div.field_with_errors'
	end

	test "valid signup information" do
		get new_user_registration_path
		assert_difference 'User.count', 1 do
			post '/users', params: { user: { email:   "user@example.com",
                                        password:              "password",
                                        password_confirmation: "password" } }
		end
		#update this later to include the proper template
		#couldn't get it to work because it was rendering with []
		#maybe try this: https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-up-(registration)
		assert_response :redirect
	end

end
