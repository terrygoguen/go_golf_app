require 'rails_helper'

RSpec.describe "couses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/couses", params: params
  end

  describe 'basic fetch' do
    let!(:couse1) { create(:couse) }
    let!(:couse2) { create(:couse) }

    it 'works' do
      expect(CouseResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['couses'])
      expect(d.map(&:id)).to match_array([couse1.id, couse2.id])
    end
  end
end
