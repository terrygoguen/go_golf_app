require "rails_helper"

RSpec.describe CouseResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "couses",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CouseResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Couse.count }.by(1)
    end
  end

  describe "updating" do
    let!(:couse) { create(:couse) }

    let(:payload) do
      {
        data: {
          id: couse.id.to_s,
          type: "couses",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CouseResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { couse.reload.updated_at }
      # .and change { couse.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:couse) { create(:couse) }

    let(:instance) do
      CouseResource.find(id: couse.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Couse.count }.by(-1)
    end
  end
end
