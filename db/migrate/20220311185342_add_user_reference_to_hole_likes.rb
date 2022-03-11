class AddUserReferenceToHoleLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hole_likes, :users
    add_index :hole_likes, :user_id
    change_column_null :hole_likes, :user_id, false
  end
end
