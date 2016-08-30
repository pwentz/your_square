class Foursquare::SessionsController < ApplicationController
  def create
    response_data = request.env["omniauth.auth"]
    session[:user_id] = response_data.uid
    session[:foursquare_token] =
    YourSquareUserService.instantiate_user(response_data)
    redirect_to root_path
  end
end
