class CreateDocentes < ActiveRecord::Migration[5.2]
  def change
    create_table :docentes do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
