class CreateMaterias < ActiveRecord::Migration[5.2]
  def change
    create_table :materias do |t|
      t.string :nombre
      t.references :carrera, foreign_key: true

      t.timestamps
    end
  end
end
