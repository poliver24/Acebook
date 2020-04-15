require 'pry'
class PostsController < ApplicationController
  def new
    p "I'm in 'new' path"
    p params
    # sessions[:wall_id] = params[:wall_id]
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if !current_user || current_user.id != @post.user_id || Time.now > (@post.created_at + (600))
      redirect_to posts_url, notice: "You cannot edit this post"
    end
  end

  def create
    if current_user
      "I'm in 'create' path"
      p params
      @post = current_user.posts.create(post_params)
      # @post.wall_id = sessions[:wall_id];

      redirect_to user_path(:id => post_params[:wall_id])

    else
      render "new"
    end
  end

  def index
    @post = Post.new
    @posts = Post.where(wall_id: 0).order(created_at: :desc)
  end

  def update
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
    params.require(:post).permit(:message, :wall_id)
  end
end
