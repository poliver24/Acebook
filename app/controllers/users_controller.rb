class UsersController < ApplicationController

  def show
    if current_user
      return render_not_found unless User.exists?(params[:id])
      @user = User.find(params[:id])
      @post = Post.new
      # @posts = Post.where(user_id: @user.id).order(created_at: :desc)
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
