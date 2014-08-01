class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out_user!
    user = current_user
    user.reset_session_token!
    session[:session_token] = nil
  end

  def require_no_user!
    redirect_to user_url(current_user) unless current_user.nil?
  end

  def require_user!
    redirect_to new_session_url if current_user.nil?
  end
end
