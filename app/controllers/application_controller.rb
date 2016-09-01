class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :username

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(uid: session[:user_id])
    end
  end

  def username
    @username ||= FoursquareUser.find_by(current_user.uid).fullname
  end
end
