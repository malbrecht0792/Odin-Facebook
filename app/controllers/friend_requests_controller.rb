class FriendRequestsController < ApplicationController

	def new
	end

	def create
		friend_request = FriendRequest.new(requestor_id: current_user.id, requested_id: params[:requested_id], accepted: false)
		user = User.find(params[:requested_id])
		if friend_request.save
			redirect_to user
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
