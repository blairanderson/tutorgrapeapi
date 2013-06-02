class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: "Account Created"
    else
      redirect_to root_path, notice: "sorry that email was taken"
    end
  end
 
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to root_path, notice: "Account Updated"
    else
      redirect_to root_path, notice: "sorry that email was taken"
    end
  end
end
