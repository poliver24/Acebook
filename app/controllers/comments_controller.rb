class CommentsController < ApplicationController

def new
  pry.binding
  @post = Post.find(params[:id])
  @comment = Comment.new
end
  
def create
  @comment = current_user.comments.create(comment_params)
  redirect_to root_path
end

private
  def comment_params  
    params.require(:comment).permit(:post_id, :body)
  end
end


