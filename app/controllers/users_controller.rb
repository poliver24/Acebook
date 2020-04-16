class UsersController < ApplicationController

  def show
    return render_not_found unless User.exists?(id: params[:id]) || User.exists?(username: params[:username])
    @user = User.find_by_username(params[:username]) || User.find(params[:id])
    @new_post = Post.new
    @posts = Post.where(wall_id: @user.id).order(created_at: :desc)

    if owner?(@user.id)
      @placeholder = "What's on your mind?"
    else
      @placeholder = "Write on #{@user.name}'s wall"
    end

  end

  def index
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
  end

  def find
    @user = User.find_by_username(params[:username])
    redirect_to users_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
