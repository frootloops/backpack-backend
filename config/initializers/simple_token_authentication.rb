SimpleTokenAuthentication.configure do |config|
  config.identifiers = { traveler: "device_token" }
  config.header_names = { traveler: {
    authentication_token: "X-Traveler-Token", device_token: "X-Traveler-Device" }
  }
  config.skip_devise_trackable = true
end
