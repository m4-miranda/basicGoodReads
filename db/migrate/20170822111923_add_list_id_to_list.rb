class AddListIdToList < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :list_id, :integer
  end
end
