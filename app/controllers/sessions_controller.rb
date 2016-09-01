class SessionsController < ApplicationController
  def new
  end

  def create
    response_data = request.env["omniauth.auth"]
    token = OauthTokenReceiver.new.exchange_code_for_token(params[:code])
    user = YourSquareUserService.new.instantiate_user(response_data.uid, token)
    if user
      session[:user_id] = user.uid
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:success] = 'Come back soon!'
    redirect_to login_path
  end
end
