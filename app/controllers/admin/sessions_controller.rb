class Admin::SessionsController < ApplicationController
  layout "sign_up"
  
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      session[:user_last_logged_in_at] = user.last_logged_in_at
      user.logged_in
      flash[:success] = "Logged in successfully."
      redirect_to_target_or_default("/admin")
    else
      flash.now[:error] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out."
    redirect_to login_path
  end
end
