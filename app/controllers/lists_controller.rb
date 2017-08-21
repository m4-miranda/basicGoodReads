class ListsController < ApplicationController
  def new
  end

  def show
    @user = current_user
    @list_of_books = @user.lists.find(params[:list_id]).books
  end

  def add
    @user = current_user
    @user.lists.find(1).books.create( title: params[:lists][:book_title],
                                      api_id: params[:lists][:book_id],
                                      image_link: params[:lists][:book_img] )
    redirect_to @user
  end
end
