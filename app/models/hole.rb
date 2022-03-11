class Hole < ApplicationRecord
  # Direct associations

  belongs_to :course,
             :class_name => "Couse"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    yardage
  end

end
