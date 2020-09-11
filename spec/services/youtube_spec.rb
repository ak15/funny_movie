require 'rails_helper'

RSpec.describe "Youtube external service" do

  it "intializes service class and sets api key" do
    service = Youtube.new
    expect(service.query_string[:query][:key]).to be_present
  end

  it "retrives video details from id" do
    response = Youtube.new.video_details("7YNlkYqzqYI")
    expect(response["items"].first["id"]).to eql("7YNlkYqzqYI")
  end

end