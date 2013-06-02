class ProfilesController < ApplicationController
  
  def submit
    profile = Profile.new(email: params[:email])
    profile.tutor = true if params[:tutor] == "true"
    profile.tutor = false if params[:tutor] == "false"
    FullContactService.get_attributes_for_person(profile)
    if profile.save

      Notifier.signup_email(profile).deliver
      
      redirect_to login_path, notice: "check your email to activate your account"
    else
      redirect_to login_path, notice:"Sorry we got an error"
    end
  end

  def activate
    @profile ||= Profile.find_by_activation_key(params[:activation_key])

    session[:profile_id] = @profile.id
  end

  def update
    @profile ||= Profile.find_by_id(params[:id])

    @user = User.new(params[:user])
    if @user.save
      if @profile.update_attributes(params[:profile])
        @user.profile = @profile
        auto_login(@user)
        redirect_to root_path, notice: "Account Activated! "
      else
        
      end
    else
      redirect_to root_path, notice: "sorry your password was not good enough, you should feel shame"
    end

  end

end
