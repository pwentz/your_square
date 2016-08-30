class FoursquareUser < OpenStruct

  def self.service
    @@service ||= YourSquareDashboardService.new
  end

  def self.find_by(id)
    service.get_user(id)
  end
end
