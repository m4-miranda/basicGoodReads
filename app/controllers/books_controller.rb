class BooksController < ApplicationController

  def index
    @user = current_user
    if params[:books] != nil
      @list_of_books = list_from_api params
    end
    render 'home'
  end

  def delete
    @user = current_user

  end

  def show
    @user = current_user
    @desired_list = @user.lists.find(params[:list_id])
    @list_of_books = @desired_list.books
  end

  def add
    @user = current_user
    @user.lists.find(params[:list_id]).books.create( title: params[:lists][:book_title],
                                      api_id: params[:lists][:book_id],
                                      image_link: params[:lists][:book_img] )
    flash.now[:success] = "Book added to favorites"
    redirect_to home_path
  end
end
