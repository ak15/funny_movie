require 'rails_helper'

RSpec.describe "Shares", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/share/new"
      expect(response).to have_http_status(:success)
    end
  end

end
