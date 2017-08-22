class AddListCounttoUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :list_count, :integer
  end
end
