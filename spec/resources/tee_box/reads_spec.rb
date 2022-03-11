require 'rails_helper'

RSpec.describe TeeBoxResource, type: :resource do
  describe 'serialization' do
    let!(:tee_box) { create(:tee_box) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(tee_box.id)
      expect(data.jsonapi_type).to eq('tee_boxes')
    end
  end

  describe 'filtering' do
    let!(:tee_box1) { create(:tee_box) }
    let!(:tee_box2) { create(:tee_box) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: tee_box2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([tee_box2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:tee_box1) { create(:tee_box) }
      let!(:tee_box2) { create(:tee_box) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            tee_box1.id,
            tee_box2.id
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
            tee_box2.id,
            tee_box1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
