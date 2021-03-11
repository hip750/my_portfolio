require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response).to have_http_status :success
    end
  end

  describe "GET /about" do
    it "正常なレスポンスを返すこと" do
      get about_path
      expect(response).to have_http_status :success
    end
  end

  describe "GET /terms_of_service" do
    it "正常なレスポンスを返すこと" do
      get terms_of_service_path
      expect(response).to have_http_status :success
    end
  end

  describe "GET /privacy_policy" do
    it "正常なレスポンスを返すこと" do
      get privacy_policy_path
      expect(response).to have_http_status :success
    end
  end

  describe "GET /signup" do
    it "正常なレスポンスを返すこと" do
      get new_user_registration_path
      expect(response).to have_http_status :success
    end
  end
end
