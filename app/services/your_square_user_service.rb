class YourSquareUserService
  attr_reader :connection
  def initialize
    @connection = Faraday.new('https://api.foursquare.com/v2/')
  end

  def instantiate_user(response_data)
    User.first_or_create(
      uid: response_data['uid'],
      token:  response_data['token']
    )
  end

  def parse_photo(photo_data)
    self.photo = photo_data.prefix[0...-1] + photo_data.suffix
  end
end
