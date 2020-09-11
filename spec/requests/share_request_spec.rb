require 'rails_helper'

RSpec.describe "Shares", type: :request do

  let(:user) { User.create(email: "atulk@gmail.com", password: "sample") }

  describe "POST /share" do
    it "creates new  movie" do
      login_as(user, scope: :user)
      post "/share", params: { url: "https://www.youtube.com/watch?v=Fh_UDQnboRw" }
      expect(Movie.count).to eql(1)
    end
  end


end
