class BooksController < ApplicationController

  def index
    @user = current_user
    if params[:books] != nil
      @list_of_books = list_from_api params
    end
    render 'home'
  end


end
