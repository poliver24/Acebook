class CommentsController < ApplicationController

def new
  pry.binding
  @post = Post.find(params[:id])
  @comment = Comment.new
end
  
def create
  @post = Post.find(params[:comment][:post_id])
  @comment = current_user.comments.create(comment_params)
  redirect_to user_path(:id => @post.user.id)
end

private
  def comment_params  
    params.require(:comment).permit(:post_id, :body)
  end
end


