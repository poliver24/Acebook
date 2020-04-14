class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  around_action :set_time_zone

  def set_time_zone(&block)
    time_zone = current_user.try(:time_zone) || 'London'
    Time.use_zone(time_zone, &block)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user) #your path
  end
end
