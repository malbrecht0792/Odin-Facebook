class LikesController < ApplicationController

	def create
		@like = Like.new(post_id: params[:post_id], user_id: current_user.id)
		@like.save
		#redirect_back(fallback_location: root_path)
	end

	def destroy
		@like = Like.find(params[:id])
		@like.delete
		redirect_back(fallback_location: root_path)
	end

end
