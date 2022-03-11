require "rails_helper"

RSpec.describe Hole, type: :model do
  describe "Direct Associations" do
    it { should have_many(:tee_boxes) }

    it { should have_many(:hole_likes) }

    it { should belong_to(:course) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
