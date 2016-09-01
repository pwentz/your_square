class VenuesController < ApplicationController
  def show
    FoursquareVenue.connection(current_user.token)
    @venue = FoursquareVenue.find(params[:venue_id])
  end
end
