Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, ENV['foursquare_id'], ENV['foursquare_secret'],
  provider_ignores_state: true
end
