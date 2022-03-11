class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :longitude, :integer
  attribute :latitude, :integer

  # Direct associations

  has_many   :hole_likes

  has_many   :course_likes

  # Indirect associations
end
