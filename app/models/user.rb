class User < ApplicationRecord
  # Direct associations

  has_many   :hole_likes,
             dependent: :destroy

  has_many   :course_likes,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end
end
