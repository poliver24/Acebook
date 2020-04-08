class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    # @post = Post.create(post_params)
    @username = @post.user.name
    redirect_to posts_url
  end

  def index
    # @posts = Post.all
    # @post = Post.find params[:id]
    # @username = @post.user.name
    @posts = Post.order(created_at: :desc)
    p "-------------------"
    # p @posts[0].user.name
    # p user = User.find(post.user_id)
    # p user.name
    p "-------------------"
    
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
