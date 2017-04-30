class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to :root
    else
      flash[:warning] = "Oops, something went wrong, Try logging in or signing up!"
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
