class AddIndexToDocentes < ActiveRecord::Migration[5.2]
  def change
    add_index :docentes, :nombre
  end
end
