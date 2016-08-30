class YourSquareDashboardService
  def initialize
    @connection = Faraday.new('https://api.foursquare.com/v2/users/')
  end

  def get_user(id)
    token = User.find_by(uid: id).token
    @connection.get(id) do |req|
      req.params['oauth_token'] = token
    end
  end
end
