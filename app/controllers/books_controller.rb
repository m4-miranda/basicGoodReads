class BooksController < ApplicationController

  def index
    @user = current_user
    render 'home'
  end

  def search
    @list_of_books = list_from_api params
    @user = current_user
    render 'home'
  end

  def delete
    @user = current_user
    @desired_list = @user.lists.find_by(list_id: params[:list_id])
    @desired_list.books.find_by(api_id: params[:book_id]).destroy
    redirect_to books_path(list_id: params[:list_id])
  end

  def show
    @user = current_user
    @desired_list = @user.lists.find_by(list_id: params[:list_id])
    @list_of_books = @desired_list.books
  end

  def add
    @user = current_user
    @user.lists.find_by(list_id: params[:list_id]).books.create( title: params[:lists][:book_title],
                                      api_id: params[:lists][:book_id],
                                      image_link: params[:lists][:book_img],
                                      author: params[:lists][:author] )
    flash.now[:success] = "Book added to favorites"
    redirect_to books_path(list_id: params[:list_id])
  end

  def update
    @user = current_user
    old_book = @user.lists.find_by(list_id: params[:lists][:old_list_id]).books.find_by(api_id: params[:lists][:book_id])
    old_book.destroy
    new_book = @user.lists.find_by(list_id: params[:new_list_id]).books.create(old_book.attributes)
    redirect_to books_path(list_id: params[:new_list_id])
  end

end
