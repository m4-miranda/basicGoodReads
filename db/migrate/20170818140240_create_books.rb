class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.strin :API_id
      t.string :title
      t.string :img

      t.timestamps
    end
    add_index :books, :API_id, unique: true
  end
end
