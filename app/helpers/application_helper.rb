module ApplicationHelper
  def loggedin1
    out = ''
    out << (link_to "#{current_user.name.capitalize}'s Page", current_user, class: 'nav-link') if logged_in?
    out.html_safe
  end

  def loggedin2
    out = ''
    out << (link_to 'Create Event', new_event_path(current_user.id), class: 'nav-link') if logged_in?
    out.html_safe
  end

  def loggedin3
    out = ''
    out << (link_to 'Log out', logout_path, class: 'nav-link', method: :delete) if logged_in?
    out.html_safe
  end

  def loggedout1
    out = ''
    out << (link_to 'Log in', login_path, class: 'nav-link') unless logged_in?
    out.html_safe
  end

  def loggedout2
    out = ''
    out << (link_to 'Sign up', signup_path, class: 'nav-link') unless logged_in?
    out.html_safe
  end
end
