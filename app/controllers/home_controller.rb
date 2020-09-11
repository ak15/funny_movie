class HomeController < ApplicationController

  def index
    @movies = Movie.includes(:user).order("created_at desc").limit(1000)
    # as of now no need of limit hard code limit to 1000
  end
end
