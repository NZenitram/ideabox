class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.nil?
      flash[:success] = "Invalid username or password"
      redirect_to login_path
    elsif @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in!"
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_categories_path
      else
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You are logged out!"
    redirect_to login_path
  end
end
