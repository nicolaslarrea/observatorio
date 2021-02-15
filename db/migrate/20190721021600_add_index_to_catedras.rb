class AddIndexToCatedras < ActiveRecord::Migration[5.2]
  def change
    add_index :catedras, :codigo
  end
end
