class CreateInscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :inscriptions do |t|
      t.string :year
      t.string :semester

      t.timestamps
    end
  end
end
