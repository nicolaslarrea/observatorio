class CreateVacantes < ActiveRecord::Migration[5.2]
  def change
    create_table :vacantes do |t|
      t.references :curso, foreign_key: true
      t.integer :numero
      t.datetime :fecha

      t.timestamps
    end
  end
end
