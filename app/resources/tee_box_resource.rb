class TeeBoxResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :hole_id, :integer
  attribute :color, :string
  attribute :yardage, :integer

  # Direct associations

  # Indirect associations

end
