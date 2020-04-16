class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.create(comment_params)
    redirect_to posts_path(@post)
end

private
  def comment_params  
    params.require(:comment).permit(:commenter, :body)
  end
end