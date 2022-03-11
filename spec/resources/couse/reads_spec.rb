require 'rails_helper'

RSpec.describe CouseResource, type: :resource do
  describe 'serialization' do
    let!(:couse) { create(:couse) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(couse.id)
      expect(data.jsonapi_type).to eq('couses')
    end
  end

  describe 'filtering' do
    let!(:couse1) { create(:couse) }
    let!(:couse2) { create(:couse) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: couse2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([couse2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:couse1) { create(:couse) }
      let!(:couse2) { create(:couse) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            couse1.id,
            couse2.id
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
            couse2.id,
            couse1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
