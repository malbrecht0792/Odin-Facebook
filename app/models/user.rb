class User < ApplicationRecord
	has_many :posts, foreign_key: "author_id"
	has_many :comments, through: :posts,
						source: :post
	has_many :likes
	has_many :active_friend_requests, class_name: "Friend Request",
									  foreign_key: "requestor_id",
									  dependent: :destroy
	has_many :friends, through: :active_friend_requests,
					   -> { where accepted: true }
					   source: :requested
	has_many :passive_friend_requests, class_name: "Friend Request",
									   foreign_key: "requested_id",
									   dependent: :destroy
	has_many :friends, through: :passive_friend_requests,
					   -> { where accepted: true },
					   source: :requestor
end
