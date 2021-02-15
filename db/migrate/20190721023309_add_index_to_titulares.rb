class AddIndexToTitulares < ActiveRecord::Migration[5.2]
  def change
    add_index :titulares, :nombre
  end
end
