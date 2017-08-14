class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update]

	def edit
	end

	def update
	end

	def show
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
