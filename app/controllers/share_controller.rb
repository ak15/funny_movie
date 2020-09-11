class ShareController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def new
  end

  def create
    response = Youtube.new.video_details(extract_id(params[:url]))
    if response["items"].present?
      movie = current_user.create_movie(response['items'].first)
      flash[:success] = 'Video added successfully'
    else
      flash[:notice] = 'Please enter proper url'
    end
    redirect_to root_path
  end

  private

  def extract_id(url)
    id = ''
    url = url
      .gsub(/(>|<)/i,'')
      .split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    if url[2] != nil
      id = url[2].split(/[^0-9a-z_\-]/i)
      id = id[0];
    else
      id = url;
    end
    id
  end
end
