class User < ActiveRecord::Base
  has_many :checkins
  has_many :venues, through: :checkins

  def self.from_omniauth(auth_data)
    where(uid: auth_data[:uid]).first_or_create do |new_user|
      new_user.uid = auth_data.uid
      new_user.name = auth_data.info.name
      new_user.location = auth_data.extra.raw_info.homeCity
      new_user.email = auth_data.extra.raw_info.contact.email
      new_user.token = auth_data.credentials.token
      # new_user.parse_photo(auth_data.extra.raw_info.photo)
      # new_user.instantiate_checkins(auth_data.extra.raw_info.checkins.items)
    end
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
