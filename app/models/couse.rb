class Couse < ApplicationRecord
  # Direct associations

  has_many   :course_likes,
             foreign_key: "course_id",
             dependent: :destroy

  has_many   :holes,
             foreign_key: "course_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
