class ApplicationController < ActionController::Base
  protect_from_forgery


  def current_profile
    @profile ||= Profile.find_by_id(session[:profile_id]) 
  end
end
