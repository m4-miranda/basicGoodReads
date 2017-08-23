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
    if logged_in?
      @user = current_user
      new_list = @user.lists.create(name: params[:lists][:name], list_id: @user.lists.count + 1 )
      redirect_to books_path(list_id: new_list.list_id)
    end
  end

  def delete
    if logged_in?
      @user = current_user
      @user.lists.find_by(list_id: params[:list_id]).destroy
      redirect_to settings_path
    end
  end

  def update
    if logged_in?
      @user = current_user
      @target_list = @user.lists.find_by( list_id: params[:list_id] )
      @target_list.name = params[:lists][:name]
      @target_list.save
      redirect_to books_path(list_id: params[:list_id])
    end
  end


end
