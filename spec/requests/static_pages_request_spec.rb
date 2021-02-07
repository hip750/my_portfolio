require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /terms_of_service" do
    it "returns http success" do
      get "/terms_of_service"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /privacy_policy" do
    it "returns http success" do
      get "/privacy_policy"
      expect(response).to have_http_status(:success)
    end
  end

end
