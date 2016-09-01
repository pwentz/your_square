class UsersController < ApplicationController
  def show
    @user = FoursquareUser.find_by(current_user.uid)
    @user_checkins = FoursquareUserCheckin.where(user: current_user.uid)
  end
end
