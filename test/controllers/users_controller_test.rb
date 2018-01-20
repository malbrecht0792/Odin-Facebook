require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @user = users(:marcel)
    @other_user = users(:ben)
  end

  # test 'should get new' do
  #   # Mimic the router behavior of setting the Devise scope through the env.
  #      @request.env['devise.mapping'] = Devise.mappings[:user]
  #   #get new_user_registration_url
  #   get :new_user_registration
  #   assert_response :success
  # end

  # test 'should redirect edit when not logged in' do
  #   @request.env['devise.mapping'] = Devise.mappings[:user]
  #     get :edit, params: {id: @user.id}
  #     assert_not flash.empty?
  #     assert_redirected_to new_user_session_url
  # end

  test 'should redirect update when not logged in' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    patch :update, params: {
      id: @user.id,
      user: { email: @user.email,
              encrypted_password: @user.encrypted_password }
    }
    assert_not flash.empty?
    assert_redirected_to new_user_session_url
  end

  # test 'should redirect edit when logged in as wrong user' do
  #   @request.env['devise.mapping'] = Devise.mappings[:user]
  #     sign_in @other_user
  #     get :edit, params: {id: @user.id}
  #     assert_not flash.empty?
  #     assert_redirected_to new_user_session_url
  # end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete :destroy, params: { id: @user.id }
    end
    assert_redirected_to new_user_session_url
  end
end
