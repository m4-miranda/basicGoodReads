class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :api_id
      t.string :image_link
      t.references :list, foreign_key: true

      t.timestamps
    end
    add_index :books, :api_id
  end
end
