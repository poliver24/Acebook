class UsersController < ApplicationController

  def show
    if current_user
      return render_not_found unless User.exists?(id: params[:id]) || User.exists?(username: params[:username])
      @user = User.find_by_username(params[:username]) || User.find(params[:id])
      @posts = Post.where(user_id: @user.id).order(created_at: :desc)
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
