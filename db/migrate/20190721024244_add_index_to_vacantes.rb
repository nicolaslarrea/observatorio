class AddIndexToVacantes < ActiveRecord::Migration[5.2]
  def change
    add_index :vacantes, :fecha
  end
end
