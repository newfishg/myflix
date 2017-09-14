class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def require_user
    if !logged_in?
      redirect_to sign_in_path
      flash[:error] = "You must logged in to do that."
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
