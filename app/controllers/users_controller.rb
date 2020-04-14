class UsersController < ApplicationController

  def show
    return render_not_found unless User.exists?(params[:id])
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc)
  end
  
  # def show
  #   if User.find_by_id(params[:id])
  #     @user = User.find_by_id(params[:id]) # returns nil or a record
  #     @posts = Post.where(user_id: @user.id).order(created_at: :desc)
  #   else
  #     p 'i dont exist'
  #     flash[:error] = "#{params[:id]} is not a User."
  #     render_not_found
  #   end
  # end

  def index
    if current_user
      @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
    else
      redirect_to login_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
