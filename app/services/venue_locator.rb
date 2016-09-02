class VenueLocator
  def initialize(current_user, search_params)
    @connection = Faraday.new('https://api.foursquare.com/v2/venues/search')
    @connection.params['near'] = get_location(current_user)
    @connection.params['oauth_token'] = current_user.token
    @connection.params['query'] = search_params['venue']
    @connection.params['v'] = '20160830'
    @current_user = current_user
  end

  def fetch_venues
    raw_venues = JSON.parse(venue_search_api.body)['response']['venues']
    FoursquareVenue.connection(@current_user.token)
    raw_venues.map do |venue|
      FoursquareVenue.new(
        name: venue['name'],
        address: venue['location']['address'],
        categories: FoursquareVenue.get_categories(venue['categories']),
        photo: FoursquareVenue.photo(venue['id']),
        hours: FoursquareVenue.venue_hours(venue['id'])
      )
    end
  end

  def venue_search_api
    @connection.get
  end

  def get_location(current_user)
    FoursquareUser.find_by(current_user.uid).location
  end
end
