class CourseLike < ApplicationRecord
  # Direct associations

  belongs_to :course,
             :class_name => "Couse"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
