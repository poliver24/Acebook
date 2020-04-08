class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if current_user 
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
    else
      render "new"
    end
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
