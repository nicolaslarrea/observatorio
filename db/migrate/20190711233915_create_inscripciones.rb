class CreateInscripciones < ActiveRecord::Migration[5.2]
  def change
    create_table :inscripciones do |t|
      t.integer :ano
      t.integer :cuatrimestre

      t.timestamps
    end
  end
end
