class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
    
  end

  def search
    @user = current_user
    @list_of_books = list_from_api params
    render 'show'
  end
end
