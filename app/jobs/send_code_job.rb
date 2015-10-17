class SendCodeJob < ActiveJob::Base
  queue_as :default

  def perform(traveler_id:)
    traveler = Traveler.find(traveler_id)

    client = Twilio::REST::Client.new
    client.messages.create(from: ENV['TWILIO_FROM'], to: traveler.phone,
                           body: "Code: #{traveler.otp_code}")
  end
end
