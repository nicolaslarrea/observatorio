class AddIndexToMaterias < ActiveRecord::Migration[5.2]
  def change
    add_index :materias, :nombre
  end
end
