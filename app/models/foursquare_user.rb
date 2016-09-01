class FoursquareUser < OpenStruct

  def self.service
    @@service ||= YourSquareDashboardService.new
  end

  def self.find_by(id)
    user_data = service.get_user(id)['response']['user']
    FoursquareUser.new(
      photo: photo_url(user_data['photo']),
      fullname: full_name(user_data['firstName'],
                          user_data['lastName']),
      followers: user_data['followers']['count'],
      following: user_data['following']['count'],
      email: user_data['contact']['email'],
      location: user_data['homeCity']
    )
  end

  def self.full_name(first_name, last_name)
    "#{first_name} #{last_name}"
  end

  def self.photo_url(photo_data)
    photo_data['prefix'] + '200x200' + photo_data['suffix']
  end
end
