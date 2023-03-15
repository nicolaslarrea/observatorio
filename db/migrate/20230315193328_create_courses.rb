class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :number
      t.string :day
      t.string :starts_at
      t.string :ends_at
      t.string :kind
      t.string :teacher
      t.integer :vacancy
      t.string :mandatory
      t.string :classroom
      t.string :observations
      t.references :semester, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
