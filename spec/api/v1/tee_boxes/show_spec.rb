require 'rails_helper'

RSpec.describe "tee_boxes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tee_boxes/#{tee_box.id}", params: params
  end

  describe 'basic fetch' do
    let!(:tee_box) { create(:tee_box) }

    it 'works' do
      expect(TeeBoxResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('tee_boxes')
      expect(d.id).to eq(tee_box.id)
    end
  end
end
