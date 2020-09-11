module ApplicationHelper

  def session_based_header
    current_user.present? ? "layouts/top_profile" : 
      "layouts/inline_login_register"
  end
end
