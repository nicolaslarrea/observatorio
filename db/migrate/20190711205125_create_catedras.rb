class CreateCatedras < ActiveRecord::Migration[5.2]
  def change
    create_table :catedras do |t|
      t.references :materia, foreign_key: true
      t.integer :numero
      t.integer :codigo

      t.timestamps
    end
  end
end
