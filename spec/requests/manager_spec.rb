require 'rails_helper'

RSpec.describe "managers API" do
  describe "Create a manager" do
    let(:manager) { create :manager }
    it "returns 201" do
      expect do
        post "/managers", 
          { manager: { 
              full_name: "test" ,
              email: "test@test.com",
              password: "test123",
              password_confirmation: "test123" 
            }
          }
      end.to change(Manager, :count).by(1)

      expect(response).to have_http_status(200)
    end
  end
end