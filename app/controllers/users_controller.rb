class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update]

	def index
		@users = User.search(params[:user_search])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			puts @user.errors.full_messages
		end
	end

	def show
		@post = current_user.posts.build
		if !params[:id].nil?
			@user = User.find(params[:id])
		else
			@user = current_user
		end
		#@user = User.find_by(email: params[:session][:email].downcase)
		@posts = @user.posts.order('posts.created_at DESC')
	end

	def destroy
	end

	private
	    
	    def set_user
	    	if !params[:session].nil?
	      		@user = User.find_by(email: params[:session][:email].downcase)
	      	end
	    end
	 
	    def user_params
	      params.require(:user).permit(:email, :encrypted_password, :avatar)
	    end

end
