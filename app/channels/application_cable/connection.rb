module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_traveler

    def connect
      self.current_traveler = find_by_token
    end

    private

    def find_by_token
      device_token = request.headers["HTTP_X_TRAVELER_DEVICE"]
      auth_token = request.headers["HTTP_X_TRAVELER_TOKEN"]

      return reject unless device_token
      return reject unless auth_token
      return reject unless traveler = Traveler.find_by(device_token: device_token)
      return reject unless traveler.authentication_token == auth_token

      traveler
    end

    def reject
      reject_unauthorized_connection
    end
  end
end
