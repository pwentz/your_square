class FoursquareUserCheckin < OpenStruct
  def self.service
    @@service ||= YourSquareDashboardService.new
  end

  def self.where(user_id_hash)
    fs_response = service.get_user_checkins(user_id_hash[:user])
    unless fs_response['count'] < 1
      fs_response['items'].map do |checkin|
        FoursquareUserCheckin.new(
          venue: checkin['venue']['name'],
          venue_id: checkin['venue']['id']
        )
      end
    end
  end
end
