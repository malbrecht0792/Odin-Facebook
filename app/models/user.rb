class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
     	   :recoverable, :rememberable, :trackable, :validatable

  	has_many :posts, foreign_key: "author_id"
	has_many :comments, foreign_key: "author_id"
	# has_many :comments, through: :posts,
	# 					source: :post
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
	has_attached_file :avatar, styles: { timeline_photo: "900x1800>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


	def self.search(first_name_search)
		where("lower(first_name) LIKE ?", "%#{first_name_search.downcase}%")
	end

	#Friends a user
	def friend(other_user)
		active_friend_requests.build(requestor_id: id, 
								     requested_id: other_user.id, 
								     accepted: false).save
		passive_friend_requests.build(requestor_id: other_user.id, 
								     requested_id: id, 
								     accepted: false).save
	end

	#Cancels friend request sent to another user
	def cancel_friend_request(other_user)
		active_friend_requests.find_by(requested_id: other_user.id).delete
		passive_friend_requests.find_by(requestor_id: other_user.id).delete
	end

	#Unfriends a user
	def unfriend(other_user)
		friends.delete(other_user)
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

	def likes?(post)
		likes.exists?(post_id: post.id, user_id: id)
	end

end
