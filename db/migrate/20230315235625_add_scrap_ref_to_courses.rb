class AddScrapRefToCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :scrap, null: false, foreign_key: true
  end
end
