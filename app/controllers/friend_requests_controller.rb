class FriendRequestsController < ApplicationController
  def index
    @users = User.joins(:active_friend_requests).where(friend_requests: { requested_id: current_user.id, accepted: false })
  end

  def create
    @user = User.find(params[:requested_id])
    current_user.friend(@user)
    redirect_to @user
  end

  def update
    @friend_request1 = FriendRequest.find(params[:id])
    @friend_request2 = FriendRequest.find(params[:id].to_i + 1)
    @friend_request1.update_attributes(accepted: true)
    @friend_request2.update_attributes(accepted: true)
    redirect_to friend_requests_url
  end

  def destroy
    @user = FriendRequest.find(params[:id]).requested
    current_user.cancel_friend_request(@user)
    redirect_to @user
  end

  def random
    user = User.find(rand(1...500))
    if user != current_user && !user.friends?(current_user) && !user.request_sent?(current_user, user)
      user.friend(current_user)
      redirect_to friend_requests_url
    else
      random
    end
  end
end
