class FriendRequestsController < ApplicationController

	def index
		@users = User.joins(:active_friend_requests).where(friend_requests: {requested_id: current_user.id, accepted: false})
	end

	def create
		@user = User.find(params[:requested_id])
		current_user.friend(@user)
		redirect_to @user
	end

	def update
		@friend_request = FriendRequest.find(params[:id])
		@friend_request.update_attributes(accepted: true)
		redirect_to friend_requests_url
	end

	def destroy
		@user = FriendRequest.find(params[:id]).requested
		current_user.unfriend(@user)
		redirect_to @user
	end

end
