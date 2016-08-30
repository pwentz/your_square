class Foursquare::SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.valid?
      session[:user_id] = user.id
    end
    redirect_to root_path
  end
end
