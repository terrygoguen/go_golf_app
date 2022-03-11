require 'rails_helper'

RSpec.describe HoleResource, type: :resource do
  describe 'serialization' do
    let!(:hole) { create(:hole) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(hole.id)
      expect(data.jsonapi_type).to eq('holes')
    end
  end

  describe 'filtering' do
    let!(:hole1) { create(:hole) }
    let!(:hole2) { create(:hole) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: hole2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([hole2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:hole1) { create(:hole) }
      let!(:hole2) { create(:hole) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            hole1.id,
            hole2.id
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
            hole2.id,
            hole1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
