class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
     	   :recoverable, :rememberable, :trackable, :validatable

  	has_many :posts, foreign_key: "author_id"
	has_many :comments, through: :posts,
						source: :post
	has_many :likes
	has_many :active_friend_requests, class_name: "Friend Request",
									  foreign_key: "requestor_id",
									  dependent: :destroy
	has_many :friends, -> { where accepted: true },
					   through: :active_friend_requests,
					   source: :requested
	has_many :passive_friend_requests, class_name: "Friend Request",
									   foreign_key: "requested_id",
									   dependent: :destroy
	has_many :friends, -> { where accepted: true },
					   through: :passive_friend_requests,
					   source: :requestor
end
