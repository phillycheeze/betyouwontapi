require 'rails_helper'

RSpec.describe "readings API" do
  describe "Create a reading" do
    let(:driver) { create :driver } 
    it "returns 201" do
      expect do
        post "readings",
          { reading: { 
              name: 'EngineSpeed',
              value: 108,
              timestamp: Time.now,
              token: driver.token
            } 
          }
      end.to change(Reading, :count).by(1)

      expect(response).to have_http_status(200)
    end
  end
end