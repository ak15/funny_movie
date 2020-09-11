class SessionController < ApplicationController

  def create
    user = User.create_or_validate_by(user_params)
    sign_in(user) if user.present?
  end

  def user_params
    params.permit(:email, :password)
  end
end
