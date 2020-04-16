class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  # before_action :authorized
  # helper_method :logged_in?
  around_action :set_time_zone

  def set_time_zone(&block)
    time_zone = current_user.try(:time_zone) || 'London'
    Time.use_zone(time_zone, &block)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user) #your path
  end

  def render_not_found
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end

  # def logged_in?
  #   !current_user.nil?
  # end

  # def authorized
  #   redirect_to '/' unless logged_in?
  # end
end


