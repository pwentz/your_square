class YourSquareDashboardService
  def initialize
    @connection = Faraday.new('https://api.foursquare.com/v2/users/')
  end

  def get_user(id)
    parse(current_user_api(id).body)
  end

  def current_user_api(id)
    token = User.find_by(uid: id).token
    @connection.get(id) do |req|
      req.params['oauth_token'] = token
      req.params['v'] = '20160830'
      req.params['m'] = 'foursquare'
    end
  end

  def get_user_checkins(id)
    parse(user_checkin_api(id).body)['response']['checkins']
  end

  def user_checkin_api(id)
    token = User.find_by(uid: id).token
    @connection.get("#{id}/checkins") do |req|
      req.params['oauth_token'] = token
      req.params['v'] = '20160830'
      req.params['m'] = 'foursquare'
    end
  end

  def parse(response_body)
    JSON.parse(response_body)
  end
end
