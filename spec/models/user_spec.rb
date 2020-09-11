require 'rails_helper'

RSpec.describe User, type: :model do

  let(:params) { { email: "sample@gmail.com", password: "sample" } }
  let(:user) { User.create(email: "sample@gmail.com", password: "sample") }
  let(:invalid_params) { { email: "sample@gmail.com", password: "abc123" } }
  let(:movie_params) { { "id" => "123",
    "snippet" => {
      "title" => "Test title",
      "description" => "Test description"
    },
    "statistics" => {
      "likeCount" => 100,
      "dislikeCount" => 0
    }
  }}

  it "authenticates user" do
    expect(user.authenticate("sample")).to be(user)
    expect(user.authenticate("wrong_password")).to be_falsey
  end

  context "creates and returns user" do
    it "creates user" do
      result = User.create_or_validate_by({ email: "abc@gmail.com", 
        password: "abc123" })
      expect(result.email).to eql("abc@gmail.com")
    end
  end

  context "validates password for created user" do
    it "validates user" do
      result = User.create_or_validate_by(params)
      expect(result.email).to eql(user.email)
    end

    it "could not validate user" do
      user #creates user when we call it
      result = User.create_or_validate_by(invalid_params)
      expect(result).to be_falsey
    end
  end

  it "creates movie for user" do
    movie = user.create_movie(movie_params)
    expect(movie.user_id).to eql(user.id)
    expect(movie.video_id).to eql(movie_params["id"])
  end
end
