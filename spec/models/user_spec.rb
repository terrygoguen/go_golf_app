require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:hole_likes) }

    it { should have_many(:course_likes) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
