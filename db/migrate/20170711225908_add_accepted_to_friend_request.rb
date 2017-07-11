class AddAcceptedToFriendRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :friend_requests, :accepted, :boolean
  end
end
