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

  describe "Retrieve all readings" do
    let(:driver) { create :driver }
    it "returns a list of readings" do
      2.times { create :reading, driver: driver }
      get "readings"

      expect(response).to be_success
      expect(JSON.parse(response.body)['readings'].count).to eq 2
    end
  end

  describe "Retrieve a reading" do
    let(:reading) { create :reading }
    it "returns a reading" do
      get "readings/#{reading.id}"

      expect(response).to be_success
      expect(JSON.parse(response.body)['reading']['id']).to eq reading.id
      expect(JSON.parse(response.body)['reading']['content']).to eq reading.content
    end
  end
end