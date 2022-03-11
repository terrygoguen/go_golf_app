require 'rails_helper'

RSpec.describe HoleLikeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'hole_likes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      HoleLikeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { HoleLike.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:hole_like) { create(:hole_like) }

    let(:payload) do
      {
        data: {
          id: hole_like.id.to_s,
          type: 'hole_likes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      HoleLikeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { hole_like.reload.updated_at }
      # .and change { hole_like.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:hole_like) { create(:hole_like) }

    let(:instance) do
      HoleLikeResource.find(id: hole_like.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { HoleLike.count }.by(-1)
    end
  end
end
