module ApplicationHelper
  def in_authentication_page?
    params[:controller] == "users/registrations" || params[:controller] == "devise/sessions"
  end
end
