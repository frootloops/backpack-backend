require 'rails_helper'

describe SendCodeJob, type: :job do
  it "sends sms to a traveler" do
    traveler = create(:traveler)
    expect do
      SendCodeJob.perform_now(traveler_id: traveler.id)
    end.to change { FakeSMS.messages.count }
  end
end
