class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  protected

  def user_for_paper_trail
    if user_signed_in?
      logger.debug 'DEBUG: user_for_paper_trail = user'
      return current_user.id
    elsif admin_user_signed_in?
      logger.debug 'DEBUG: user_for_paper_trail = admin'
      return current_admin_user.username
    else
      logger.debug 'DEBUG: user_for_paper_trail = system'
      return "System"
    end
  end
  # rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
  #   render :text => exception, :status => 500
  # end
end
