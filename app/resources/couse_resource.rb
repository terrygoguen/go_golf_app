class CouseResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :address, :string
  attribute :phone_number, :integer
  attribute :rating, :integer
  attribute :handicap, :integer
  attribute :longitude, :integer
  attribute :latitude, :integer

  # Direct associations

  # Indirect associations

end
