class YourSquareUserService
  attr_reader :connection
  class << self
    def instantiate_user(response_data)
      User.create(
        uid: response_data.uid,
        token:  response_data.credentials.token
      )
    end
  end

  def initialize
    @connection = Faraday.new('https://api.foursquare.com/v2/')
  end

  def instantiate_user

  end

  def parse_photo(photo_data)
    self.photo = photo_data.prefix[0...-1] + photo_data.suffix
  end

  def instantiate_checkins(venue_checkins)
    # venue_checkins.each do |check_in|
    #   check_in.create(
    #     #check-in data
    #   )
    # end
  end
end
