module UsersHelper
  def initialize_list_user(user)
    @user.update_attribute(:list_count, 4)
    @user.lists.create(name: "Favorites", list_id: 1)
    @user.lists.create(name: "To-Read", list_id: 2)
    @user.lists.create(name: "Read", list_id: 3)
    @user.lists.create(name: "Reading", list_id: 4)
    @user.save
    @user
  end
end
