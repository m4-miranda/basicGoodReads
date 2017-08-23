class ChangePublishedDateTypeInBooks < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :publishedDate, :string
  end
end
