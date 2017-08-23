class AddPublishedDateIsbNtoBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :publishedDate, :datetime
    add_column :books, :ISBN, :string
  end
end
