class CommentsController < ApplicationController

def new
  @post = Post.find(params[:id])
  @comment = Comment.new
end
  
def create
  @post = Post.find(params[:id])
  @comment = @post.comments.create(comment_params)
  redirect_to posts_path
end

private
  def comment_params  
    params.require(:comment).permit(:commenter, :body)
  end
end


# create_table :comments do |t|
#   t.string :commenter
#   t.text :body