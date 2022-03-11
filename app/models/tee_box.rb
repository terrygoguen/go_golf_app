class TeeBox < ApplicationRecord
  # Direct associations

  belongs_to :hole

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
