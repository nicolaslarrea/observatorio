class CreateScraps < ActiveRecord::Migration[7.0]
  def change
    create_table :scraps do |t|
      t.integer :number
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
