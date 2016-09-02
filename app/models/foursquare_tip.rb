class FoursquareTip
  attr_reader :created_at,
              :user,
              :description,
              :agree_count,
              :disagree_count,
              :photo

  def initialize(tip_hash)
    @created_at = format_time(tip_hash['createdAt'])
    @user = get_user(tip_hash['user'])
    @description = tip_hash['text']
    @photo = get_photo(tip_hash['user']['photo'])
    @agree_count = tip_hash['agreeCount']
    @disagree_count = tip_hash['disagreeCount']
  end

  def get_user(user_data)
    "#{user_data['firstName']} #{user_data['lastName']}"
  end

  def get_photo(photo_hash)
    "#{photo_hash['prefix']}150x150#{photo_hash['suffix']}"
  end

  def format_time(time_in_seconds)
    Time.at(time_in_seconds).strftime('%m-%d-%Y')
  end
end
