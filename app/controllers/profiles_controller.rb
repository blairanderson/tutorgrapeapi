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
      if profile.user.nil?
        Notifier.signup_email(profile).deliver
        redirect_to login_path, notice:"Resent Activation Email"
      else
        redirect_to login_path, notice:"Account for #{params[:email]} already exists."
      end
    end
  end

  def activate
    @profile ||= Profile.find_by_activation_key(params[:activation_key])

    session[:profile_id] = @profile.id
  end



  def update
    @profile ||= Profile.find_by_id(params[:id])
    @user = User.new(valid_params)
    if @user.save
      if @profile.update_attributes(params[:profile])
        @user.profile = @profile
        auto_login(@user)
        redirect_to user_path(@user), notice: "Account Activated! "
      else
        redirect_to "/activate/"+@profile.activation_key, notice: "Please fill out some attributes"
      end
    else
      redirect_to root_path, notice: "sorry your password was not good enough, you should feel shame"
    end
  end

private

  def valid_params
    {
    :username => params[:user][:username] || @profile.first_name,
    :email => params[:user][:email] || @profile.email,
    :password => params[:user][:password],
    :password_confirmation => params[:user][:password_confirmation]
    }
  end
end
