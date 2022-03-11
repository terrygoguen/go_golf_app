class AddHoleReferenceToTeeBoxes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tee_boxes, :holes
    add_index :tee_boxes, :hole_id
    change_column_null :tee_boxes, :hole_id, false
  end
end
