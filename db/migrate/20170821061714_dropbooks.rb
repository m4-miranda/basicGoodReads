class Dropbooks < ActiveRecord::Migration[5.1]
  def change
    drop_table :books
  end
end
