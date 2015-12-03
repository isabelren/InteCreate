class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id]
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

end
