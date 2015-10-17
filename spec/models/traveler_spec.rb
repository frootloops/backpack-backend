require 'rails_helper'

describe Traveler, type: :model do
  describe "validation" do
    it "phone validation" do
      traveler = build(:traveler, phone: "+79999808630")
      expect(traveler).to be_valid
    end
  end
end
