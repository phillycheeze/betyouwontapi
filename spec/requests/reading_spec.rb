require 'rails_helper'

RSpec.describe "readings API" do
  describe "Create a reading" do
    let(:driver) { create :driver } 
    it "returns 201" do
      expect do
        post "readings",
          { reading: { 
              speed: 20,
              odometer: 45,
              rpm: 3500,
              longitude: 60,
              latitude: 40,
              timestamp: Time.now,
              token: driver.token
            } 
          }
      end.to change(Reading, :count).by(1)

      expect(response).to have_http_status(200)
    end
  end
end