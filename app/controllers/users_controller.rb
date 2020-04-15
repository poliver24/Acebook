class UsersController < ApplicationController

  def show
    if current_user
      return render_not_found unless User.exists?(id: params[:id]) || User.exists?(username: params[:username])
      @user = User.find_by_username(params[:username]) || User.find(params[:id])
      @post = Post.new

      @posts = Post.where(wall_id: @user.id).order(created_at: :desc)

      if @user.id == current_user.id
        @placeholder = "What's on your mind?"
      else
        @placeholder = "Write on #{@user.name}'s wall"
      end

    else
      redirect_to new_user_session_path
    end
  end

  def index
    if current_user
      @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
    else
      redirect_to new_user_session_path
    end
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
