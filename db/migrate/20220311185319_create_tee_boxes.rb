class CreateTeeBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :tee_boxes do |t|
      t.integer :hole_id
      t.string :color
      t.integer :yardage

      t.timestamps
    end
  end
end
