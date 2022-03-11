require "rails_helper"

RSpec.describe TeeBox, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:hole) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
