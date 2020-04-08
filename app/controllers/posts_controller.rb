class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
