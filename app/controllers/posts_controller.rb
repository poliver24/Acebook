class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit 
    @post = Post.find(params[:id])

    if current_user.id != 1
      redirect_to posts_url, notice: "You cannot edit this post"
    end
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
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      if @post.update(post_params)
        redirect_to posts_url
      else
        render 'edit'
      end
    else
      flash.now[:alert] = "You can't edit other people's posts"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
