class PostsController < ApplicationController

	def index
		@posts = current_user.friends.collect(&:posts).flatten.sort_by(&:created_at).reverse!
		@post = current_user.posts.build
	end

	def new
	end

	def create
		@post = current_user.posts.build(content: post_params[:content])
		if @post.save
			redirect_back(fallback_location: root_path)
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def post_params
			params.require(:post).permit(:content)
		end
end