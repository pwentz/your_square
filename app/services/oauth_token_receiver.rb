class OauthTokenReceiver
  def initialize
    @connection = Faraday.new('https://foursquare.com/oauth2/access_token')
  end

  def exchange_code_for_token(code)
    token_hash = send_token_request(code).body
    parse(token_hash)["access_token"]
  end

  def send_token_request(code)
    @connection.get do |req|
      req.params['client_id'] = ENV['foursquare_id']
      req.params['client_secret'] = ENV['foursquare_secret']
      req.params['grant_type'] = 'authorization_code'
      req.params['redirect_uri'] = 'http://localhost:3000/auth/foursquare/callback'
      req.params['code'] = code
    end
  end

  def parse(response_body)
    JSON.parse(response_body)
  end
end
