class AddUserReferenceToCourseLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :course_likes, :users
    add_index :course_likes, :user_id
    change_column_null :course_likes, :user_id, false
  end
end
