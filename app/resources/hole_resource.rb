class HoleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :yardage, :integer
  attribute :par, :integer
  attribute :handicap, :integer
  attribute :polygon_map, :string
  attribute :center_of_green_longitude, :integer
  attribute :center_of_green_latitude, :integer
  attribute :course_id, :integer

  # Direct associations

  # Indirect associations

end
