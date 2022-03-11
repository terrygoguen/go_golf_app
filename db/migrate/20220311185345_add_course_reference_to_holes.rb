class AddCourseReferenceToHoles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :holes, :couses, column: :course_id
    add_index :holes, :course_id
    change_column_null :holes, :course_id, false
  end
end
