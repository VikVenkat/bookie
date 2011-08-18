class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #Does Facebooker need the below?
  #ensure_application_is_installed_by_facebook_user
  #filter_parameter_logging :fb_sig_friends
end
