class AddCourseReferenceToCourseLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :course_likes, :couses, column: :course_id
    add_index :course_likes, :course_id
    change_column_null :course_likes, :course_id, false
  end
end
