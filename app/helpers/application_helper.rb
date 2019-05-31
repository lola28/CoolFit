module ApplicationHelper
  def in_authentication_page?
    params[:controller] == "devise/registrations" || params[:controller] == "devise/sessions"
  end
end
