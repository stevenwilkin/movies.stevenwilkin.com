# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :admin? # let the view know the login status

  before_filter :nav

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected

  # check auth credentials against hashed values and set a value in the session if correct
  def authenticate
    unless session[:admin]
      @success = authenticate_or_request_with_http_digest('Admin') do |user|
        'cb66e0c44e63c5c141c3b2ce99155575'  # MD5::hexdigest('USER:Admin:PASS')
      end
      session[:admin] = 1 if @success
    end
    session[:admin]
  end

  # are we logged in?
  def admin?
    session[:admin]
  end

  # movie navigation for the layout
  def nav
    @nav = Movie.first_letters_and_count
  end

end
