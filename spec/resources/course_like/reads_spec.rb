require 'rails_helper'

RSpec.describe CourseLikeResource, type: :resource do
  describe 'serialization' do
    let!(:course_like) { create(:course_like) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(course_like.id)
      expect(data.jsonapi_type).to eq('course_likes')
    end
  end

  describe 'filtering' do
    let!(:course_like1) { create(:course_like) }
    let!(:course_like2) { create(:course_like) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: course_like2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([course_like2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:course_like1) { create(:course_like) }
      let!(:course_like2) { create(:course_like) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            course_like1.id,
            course_like2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            course_like2.id,
            course_like1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
