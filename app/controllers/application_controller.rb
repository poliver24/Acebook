class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  around_action :set_time_zone

  def set_time_zone(&block)
    time_zone = current_user.try(:time_zone) || 'London'
    Time.use_zone(time_zone, &block)
  end
end
