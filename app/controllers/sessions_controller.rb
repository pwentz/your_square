class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to dashboard_path
    else
      flash[:danger] = 'Invalid login credentials'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = 'Come back soon!'
    redirect_to login_path
  end
end
