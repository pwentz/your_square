class FoursquareVenue < OpenStruct
  def self.service
    @@service ||= YourSquareVenueService.new
  end

  def self.connection(token)
    service.instantiate_token(token)
  end

  def self.find(id)
    venue_response = service.get_venue(id)
    venue_hours = service.get_venue_hours(id)
    venue_checkins = venue_response['justifications']
    venue_tips = service.get_venue_tips(id)['tips']
    FoursquareVenue.new(
      name: venue_response['name'],
      address: venue_response['location']['address'],
      categories: get_categories(venue_response['categories']),
      hours: venue_hours['hours']['timeframes'],
      tips: get_tips(venue_tips['items'])
    )
  end

  def self.get_categories(categories)
    categories.map do |cat|
      cat['name']
    end
  end

  def self.get_tips(venue_tips)
    venue_tips.map do |tip|
      FoursquareTip.new(tip)
    end.sort_by{|t| t.agree_count }.reverse
  end
end
