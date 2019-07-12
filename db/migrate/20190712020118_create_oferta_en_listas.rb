class CreateOfertaEnListas < ActiveRecord::Migration[5.2]
  def change
    create_table :oferta_en_listas do |t|
      t.references :inscripcion, foreign_key: true
      t.references :catedra, foreign_key: true
      t.references :titular, foreign_key: true

      t.timestamps
    end
  end
end
