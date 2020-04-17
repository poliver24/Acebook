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

def edit
  p params
  # @post = Post.find(params[:id])
  @comment = Comment.find(params[:id])
  if !owner?(@comment.user_id) || Time.now > (@comment.created_at + (600))
    redirect_to user_path(:id => @comment.post_id), notice: "You cannot edit this post"
  end
end

def update
  @comment = Comment.find(params[:id])
  if @comment.update_attribute(:body, comment_params['body'])
    redirect_to user_path(:id => @comment.post.wall_id)
  else
    render 'edit'
  end
end

private
  def comment_params  
    params.require(:comment).permit(:post_id, :body)
  end
end


