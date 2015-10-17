require 'spec_helper'

describe Api::V1::BonjourController, type: :request do
  describe "GET #check" do
    xit "returns 401 error" do
      get '/api/v1/bonjour/check', {}
      expect(response.status).to eq(401)

      device = create(:device, traveler: create(:traveler))
      headers = { "Authorization": encode_credentials("fake", uuid: device.uuid) }
      get '/api/v1/bonjour/check', {}, headers
      expect(response.status).to eq(401)
    end

    xit "returns 200 ok" do
      device = create(:device, traveler: create(:traveler))
      headers = { "Authorization": encode_credentials(device.access_token, uuid: device.uuid) }
      get '/api/v1/bonjour/check', {}, headers
      expect(response).to be_success
    end
  end

  describe "POST #bonjour" do
    context "with new credential" do
      xit "reates a traveler" do
        headers = { "Authorization": encode_credentials("*", uuid: "4001") }
        post '/api/v1/bonjour', { phone: '+79999808630' }, headers
        device, traveler = Device.last, Traveler.last
        expect(response).to be_success
        expect(device.uuid).to eql("4001")
        expect(device.traveler).to eql(traveler)
        expect(traveler.mobile_number).to eql("+79999808630")

        # code = FakeSMS.messages.last.body[/\d+/]
      end
    end
  end
end
