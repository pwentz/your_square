class YourSquareVenueService
  def initialize
    @connection = Faraday.new('https://api.foursquare.com/v2/venues/')
  end

  def instantiate_token(token)
    @connection.params['oauth_token'] = token
    @connection.params['v'] = '20160830'
    @connection.params['m'] = 'foursquare'
  end

  def get_venue(id)
    parse(venue_api(id).body)['response']['venue']
  end

  def venue_api(id)
    @connection.get(id)
  end

  def get_venue_hours(id)
    parse(venue_hours_api(id).body)['response']
  end

  def venue_hours_api(id)
    @connection.get("#{id}/hours")
  end

  def get_venue_tips(id)
    parse(venue_tips_api(id).body)['response']
  end

  def venue_tips_api(id)
    @connection.get("#{id}/tips") do |req|
      # req.params['oauth_token'] = @token
      req.params['client_id'] = ENV['foursquare_id']
      req.params['client_secret'] = ENV['foursquare_secret']
      req.params['v'] = '20160830'
      req.params['m'] = 'foursquare'
    end
  end

  def get_venue_photos(id)
    parse(venue_photos_api(id).body)
  end

  def venue_photos_api(id)
    @connection.get("#{id}/photos") do |req|
      req.params['limit'] = 1
    end
  end

  def parse(response_body)
    JSON.parse(response_body)
  end
end
