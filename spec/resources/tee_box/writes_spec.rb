require "rails_helper"

RSpec.describe TeeBoxResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "tee_boxes",
          attributes: {},
        },
      }
    end

    let(:instance) do
      TeeBoxResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { TeeBox.count }.by(1)
    end
  end

  describe "updating" do
    let!(:tee_box) { create(:tee_box) }

    let(:payload) do
      {
        data: {
          id: tee_box.id.to_s,
          type: "tee_boxes",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TeeBoxResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { tee_box.reload.updated_at }
      # .and change { tee_box.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:tee_box) { create(:tee_box) }

    let(:instance) do
      TeeBoxResource.find(id: tee_box.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { TeeBox.count }.by(-1)
    end
  end
end
