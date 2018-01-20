class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    @users = User.search(params[:user_search])
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      puts @user.errors.full_messages
    end
  end

  def show
    @post = current_user.posts.build
    @posts = @user.posts.order('posts.created_at DESC')
  end

  private

  def set_user
    @user = if !params[:id].nil?
              User.find(params[:id])
            else
              current_user
            end
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :avatar)
  end
end
