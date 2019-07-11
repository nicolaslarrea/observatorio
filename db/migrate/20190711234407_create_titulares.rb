class CreateTitulares < ActiveRecord::Migration[5.2]
  def change
    create_table :titulares do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
