class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    if logged_in?
      @user = current_user
      render 'home'
    else
      redirect_to login_path
    end
  end
end
