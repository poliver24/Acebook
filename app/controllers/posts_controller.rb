class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # p @post
    # p posts_url
    redirect_to posts_url
  end

  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
    p @posts
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
