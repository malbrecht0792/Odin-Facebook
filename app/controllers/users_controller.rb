class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update]

	def edit
	end

	def update
	end

	def show
		@post = current_user.posts.build
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
	      params.require(:user).permit(:email, :encrypted_password)
	    end

end
