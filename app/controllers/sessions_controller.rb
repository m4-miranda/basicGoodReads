class SessionsController < ApplicationController
  def new
    if logged_in?
      user = current_user
      redirect_to home_path
    else
      render 'new'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = "Successfully signed in"
      log_in user
      redirect_to home_path
    else
      flash.now[:danger] = "Incorrect password/username"
      render 'new'
    end
  end

  def delete
    log_out
    redirect_to root_url
  end

end
