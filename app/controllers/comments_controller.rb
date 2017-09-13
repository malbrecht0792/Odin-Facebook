class CommentsController < ApplicationController

	def create
		@comment = Comment.new(author_id: current_user.id, 
							   post_id: params[:post_id],
							   content: params[:content])
		puts @comment.inspect
		@comment.save
		puts @comment.errors.full_messages
		redirect_back(fallback_location: root_path)
	end

	def destroy
	end

	private

		def comment_params
			params.permit(:content)
		end
end
