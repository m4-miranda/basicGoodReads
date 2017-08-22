class BooksController < ApplicationController

  def index
    @user = current_user
    render 'home'
  end

  def search
    @user = current_user
    @list_of_books = list_from_api params
    render 'home'
  end

end
