class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
     	   :recoverable, :rememberable, :trackable, :validatable

  	has_many :posts, foreign_key: "author_id"
	has_many :comments, through: :posts,
						source: :post
	has_many :likes
	has_many :active_friend_requests, class_name: "FriendRequest",
									  foreign_key: "requestor_id",
									  dependent: :destroy
	has_many :friends, -> { where("accepted = ?", true).references(:active_friend_requests) },
					   through: :active_friend_requests,
					   source: :requested
	has_many :passive_friend_requests, class_name: "FriendRequest",
									   foreign_key: "requested_id",
									   dependent: :destroy
	has_many :friends, -> { where("accepted = ?", true).references(:passive_friend_requests) },
					   through: :passive_friend_requests,
					   source: :requestor

	# has_many :friends, -> { where accepted: true },
	# 				   through: :passive_friend_requests,
	# 				   source: :requestor


	def self.search(first_name_search)
		where("lower(first_name) LIKE ?", "%#{first_name_search.downcase}%")
	end

	#Returns true if the current user is friends with the other user.
	def friends?(other_user)
		friends.include?(other_user)
	end

	#Returns true if the current user has sent a friend request to the other user 
	#but it has not been accepted yet
	def request_sent?(current_user, other_user)
		if !other_user.nil?
			active_friend_requests.exists?(requestor_id: current_user.id,
										   requested_id: other_user.id)
		end
	end





end
