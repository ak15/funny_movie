require 'rails_helper'
require "pry"
RSpec.describe "Homes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
