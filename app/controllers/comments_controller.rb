class CommentsController < ApplicationController
  def create
    @comment = Comment.create!(author_id: current_user.id,
                               post_id: params[:post_id],
                               content: params[:content])
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.permit(:content)
  end
end
