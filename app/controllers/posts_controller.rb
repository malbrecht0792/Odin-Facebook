class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
	end

	def create
		@post = current_user.posts.build(content: post_params[:content])
		if @post.save
			render 'users/show'
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
