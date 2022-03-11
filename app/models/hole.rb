class Hole < ApplicationRecord
  # Direct associations

  has_many   :tee_boxes,
             :dependent => :destroy

  has_many   :hole_likes,
             :dependent => :destroy

  belongs_to :course,
             :class_name => "Couse"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    yardage
  end

end
