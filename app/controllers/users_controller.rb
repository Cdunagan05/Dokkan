class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      error = user.errors.messages.first[1][0]
      flash[:error] = possible_errors[error]
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def possible_errors
    {"has already been taken" => "Someone else already has that username or password!",
     "doesn't match Password" => "Your passwords do not match!"}
  end
end
