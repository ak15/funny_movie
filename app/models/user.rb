class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :movies

  class << self
    def create_or_validate_by(params)
      user = User.find_by(email: params[:email])
      user.present? ? user.authenticate(params[:password]) : 
        User.create(params)
    end
  end

  def authenticate(password)
    return self if valid_password?(password)
  end

  def create_movie(movie)
    self.movies.create(
      video_id: movie["id"],
      title: movie["snippet"]["title"],
      description: movie["snippet"]["description"],
      like_count: movie["statistics"]["likeCount"],
      dislike_count: movie["statistics"]["dislikeCount"]
    )
  end
end
