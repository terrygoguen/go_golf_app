class AddHoleReferenceToHoleLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hole_likes, :holes
    add_index :hole_likes, :hole_id
    change_column_null :hole_likes, :hole_id, false
  end
end
