require 'rails_helper'

describe Traveler, type: :model do
  describe "validation" do
    it "mobile_number validation" do
      traveler = build(:traveler, mobile_number: "+79999808630")
      expect(traveler).to be_valid
    end
  end
end
