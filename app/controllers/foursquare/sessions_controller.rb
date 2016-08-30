class Foursquare::SessionsController < ApplicationController
  def create
    response_data = request.env["omniauth.auth"]
    token = OauthTokenReceiver.new.exchange_code_for_token(params[:code])
    YourSquareUserService.new.instantiate_user(response_data.uid, token)
    session[:user_id] = response_data.uid
    redirect_to root_path
  end
end
