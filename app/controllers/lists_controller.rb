class ListsController < ApplicationController
  def new
    if logged_in?
      @user = current_user
      render 'new'
    else
      redirect_to login_path
    end
  end

  def create
    
  end



end
