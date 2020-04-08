class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif ENV['RAILS_ENV'] == 'test'
      @current_user ||= User.new(id: 1, name: "Jack", email: "jack@example.com", password: "password123"  )
    else
      @current_user = nil
    end
  end
end
