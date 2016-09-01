class FoursquareTip
  attr_reader :created_at,
              :user,
              :description,
              :agree_count,
              :disagree_count

  def initialize(tip_hash)
    @created_at = tip_hash['createdAt']
    @user = get_user(tip_hash['user'])
    @photo = get_user_photo(tip_hash['user'])
    @description = tip_hash['text']
    @agree_count = tip_hash['agreeCount']
    @disagree_count = tip_hash['disagreeCount']
  end

  def get_user(user_data)
    "#{user_data['firstName']} #{user_data['lastName']}"
  end
end
