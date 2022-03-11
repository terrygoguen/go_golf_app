require 'rails_helper'

RSpec.describe CourseLikeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'course_likes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CourseLikeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { CourseLike.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:course_like) { create(:course_like) }

    let(:payload) do
      {
        data: {
          id: course_like.id.to_s,
          type: 'course_likes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CourseLikeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { course_like.reload.updated_at }
      # .and change { course_like.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:course_like) { create(:course_like) }

    let(:instance) do
      CourseLikeResource.find(id: course_like.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { CourseLike.count }.by(-1)
    end
  end
end
