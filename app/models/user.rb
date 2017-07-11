class User < ApplicationRecord
	has_many :posts, foreign_key: :author_id
	has_many :comments, through: :posts,
						source: :post
	has_many :likes
	has_many :active_friend_requests, foreign_key: :requestor_id
	has_many :friends, through: :active_friend_requests

end
