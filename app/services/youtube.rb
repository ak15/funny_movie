class Youtube
  include HTTParty
  base_uri "https://www.googleapis.com/youtube/v3/"

  attr_accessor :query_string

  def initialize
    @query_string = { 
      query: { 
        key: ENV['GOOGLE_API_KEY']      
      }
    }
  end

  def video_details(id)
    @query_string[:query].merge!({
      id: id,
      part: "snippet,contentDetails,statistics"
    })
    self.class.get("/videos", query_string)
  end
end