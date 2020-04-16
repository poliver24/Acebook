class CommentsController < ApplicationController

def new
  @post = Post.find(params[:id])
  @comment = Comment.new
end
  
def create
  @post = Post.find(params[:post_id])
  p params
  params[:comment][:user_id] = current_user.id
  p params
  @comment = @post.comments.create(comment_params)
  
  redirect_to posts_path
end

private
  def comment_params  
    params.require(:comment).permit(:user_id, :body)
  end
end


