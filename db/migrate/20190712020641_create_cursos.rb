class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.references :oferta_en_lista, foreign_key: true
      t.references :docente, foreign_key: true
      t.string :tipo
      t.string :numero
      t.string :dia
      t.string :inicio
      t.string :fin
      t.string :obligatorio
      t.string :aula
      t.string :observaciones

      t.timestamps
    end
  end
end
