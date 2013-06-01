class ProfilesController < ApplicationController
  def submit
    profile = Profile.new(email: params[:email])
    profile.tutor = true if params[:tutor] == "true"
    profile.tutor = false if params[:tutor] == "false"
    FullContactService.get_attributes_for_person(profile)
    if profile.save
      redirect_to root_path, notice: "check your email to activate your account"
    else
      redirect_to root_path, notice:"Sorry we got an error"
    end
  end
end
