require 'rails_helper'

RSpec.describe "drivers API" do
  describe "Create a driver" do
    let(:manager) { create :manager }
    it "returns 201" do
      expect do
        post "drivers", 
          { driver: { name: "test" } }, 
          { authorization: "Token #{manager.auth_token}" }
      end.to change(Driver, :count).by(1)

      expect(response).to have_http_status(200)
    end
  end

  describe "Validate a driver" do
    let(:driver) { create :driver }
    context "with valid token" do
      it "returns the driver" do
        post "token", 
          { token: driver.token }

        expect(response).to have_http_status(200)
      end
    end
    context "with invalid token" do
      it "returns 204" do
        post "token", 
          { token: "lhljlkj" }

        expect(response).to have_http_status(204)
      end
    end
  end
end