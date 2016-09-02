class FoursquareVenue < OpenStruct
  def self.service
    @@service ||= YourSquareVenueService.new
  end

  def self.connection(token)
    service.instantiate_token(token)
  end

  def self.find(id)
    venue_response = service.get_venue(id)
    FoursquareVenue.new(
      name: venue_response['name'],
      address: venue_response['location']['address'],
      categories: get_categories(venue_response['categories']),
      hours: venue_hours(id),
      tips: get_tips(id)
    )
  end

  def self.venue_hours(id)
    service.get_venue_hours(id)['hours']['timeframes']
  end

  def self.venue_tips(id)
    service.get_venue_tips(id)['tips']['items']
  end

  def self.get_categories(categories)
    categories.map do |cat|
      cat['name']
    end
  end

  def self.get_tips(id)
    venue_tips(id).map do |tip|
      FoursquareTip.new(tip)
    end.sort_by{ |t| t.agree_count }.reverse
  end

  def self.photo(id)
    raw_photo = service.get_venue_photos(id)['response']['photos']['items'][0]
    "#{raw_photo['prefix']}300x300#{raw_photo['suffix']}"
  end

end
