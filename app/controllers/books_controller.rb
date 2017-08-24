class BooksController < ApplicationController

  def index
    if !logged_in?
      redirect_to login_path
    else
      @user = current_user
      render 'home'
    end
  end

  def search
    if logged_in?
      @list_of_books = list_from_api params
      @user = current_user
      render 'home'
    end
  end

  def delete
    if logged_in?
      @user = current_user
      @desired_list = @user.lists.find_by(list_id: params[:list_id])
      @desired_list.books.find_by(api_id: params[:book_id]).destroy
      redirect_to books_path(list_id: params[:list_id])
    end
  end

  def show
    if logged_in?
      @user = current_user
      if params[:list_id].to_i <= @user.lists.count
        @user = current_user
        @desired_list = @user.lists.find_by(list_id: params[:list_id])
        @list_of_books = @desired_list.books
      else
        redirect_to home_path
      end
    else
      redirect_to login_path
    end
  end

  def add
    if logged_in?
      @user = current_user
      new_book = volume_from_api params[:books][:api_id]
      @user.lists.find_by(list_id: params[:list_id]).books.create( new_book.attributes )

      flash.now[:success] = "Book added to favorites"
      redirect_to books_path(list_id: params[:list_id])
    end
  end

  def update
    if logged_in?
      @user = current_user
      old_book = @user.lists.find_by(list_id: params[:lists][:old_list_id]).books.find_by(api_id: params[:lists][:book_id])
      old_book.destroy
      new_book = @user.lists.find_by(list_id: params[:new_list_id]).books.create(old_book.attributes)
      redirect_to books_path(list_id: params[:new_list_id])
    end
  end


end
