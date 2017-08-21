class BooksController < ApplicationController
  def search
    @list_of_books = list_from_api params
    @user = current_user
    render 'users/show'
  end
end
