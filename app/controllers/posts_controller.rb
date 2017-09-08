class PostsController < ApplicationController

	def index
		@posts = current_user.friends.collect(&:posts).flatten.sort_by(&:created_at).reverse!
	end

	def new
	end

	def create
		@post = current_user.posts.build(content: post_params[:content])
		if @post.save
			#render 'users/show/#{params[:id]}'
			#redirect_to :controller => 'users', :action => 'show', :id => params[:id]
			@user = User.find(params[:id])
			redirect_to user_path(@user, id: params[:id])
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