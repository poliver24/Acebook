require 'pry'
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])

    if !current_user || current_user.id != @post.user_id
      redirect_to posts_url, notice: "You cannot edit this post"
    end
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

  def update
    # binding.pry
    @post = Post.find(params[:id])
    # if current_user.id == 1
      if @post.update(post_params)
        redirect_to posts_url
      else
        render 'edit'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    if !current_user || current_user.id != @post.user_id
      redirect_to posts_url, notice: "You cannot delete this post"
    else
      @post.destroy
      redirect_to posts_url
    end

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
