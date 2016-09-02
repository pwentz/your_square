class VenuesController < ApplicationController
  def index
    @venues = VenueLocator.new(current_user, params[:search]).fetch_venues
  end

  def show
    FoursquareVenue.connection(current_user.token)
    @venue = FoursquareVenue.find(params[:venue_id])
  end
end
