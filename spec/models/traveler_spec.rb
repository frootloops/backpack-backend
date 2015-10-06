require 'rails_helper'

describe Traveler, type: :model do
  describe "validation" do
    it "mobile_number validation" do
      traveler = build(:traveler, mobile_number: "+79999808630")
      expect(traveler).to be_valid
    end
  end

  describe "#device" do
    it "takes any device" do
      traveler = create(:traveler, mobile_number: "+79999808630")
      expect(traveler.device).to be_nil

      traveler.devices << create(:device)
      expect(traveler.device).to_not be_nil
    end
  end
end
