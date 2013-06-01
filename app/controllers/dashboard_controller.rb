class DashboardController < ApplicationController
  
  def create_account
    @user = User.new    
  end

  def home
    if logged_in?
      @user = current_user
    else
      redirect_to login_path
    end
  end
end
