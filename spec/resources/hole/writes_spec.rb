require 'rails_helper'

RSpec.describe HoleResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'holes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      HoleResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Hole.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:hole) { create(:hole) }

    let(:payload) do
      {
        data: {
          id: hole.id.to_s,
          type: 'holes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      HoleResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { hole.reload.updated_at }
      # .and change { hole.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:hole) { create(:hole) }

    let(:instance) do
      HoleResource.find(id: hole.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Hole.count }.by(-1)
    end
  end
end
