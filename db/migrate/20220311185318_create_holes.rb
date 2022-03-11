class CreateHoles < ActiveRecord::Migration[6.0]
  def change
    create_table :holes do |t|
      t.integer :yardage
      t.integer :par
      t.integer :handicap
      t.string :polygon_map
      t.integer :center_of_green_longitude
      t.integer :center_of_green_latitude
      t.integer :course_id

      t.timestamps
    end
  end
end
