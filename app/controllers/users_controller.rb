class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to posts_url
    else
      flash.now[:alert] = "invalid email or password" 
      render :new
    end
    session[:user_id] = @user.id
  end

  def index
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
