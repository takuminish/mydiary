require 'rails_helper'

RSpec.describe "Signins", type: :request do
  describe "GET /signins" do
    it "works! (now write some real specs)" do
      get signins_path
      expect(response).to have_http_status(200)
    end
  end
end
