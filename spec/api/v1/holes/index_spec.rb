require 'rails_helper'

RSpec.describe "holes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/holes", params: params
  end

  describe 'basic fetch' do
    let!(:hole1) { create(:hole) }
    let!(:hole2) { create(:hole) }

    it 'works' do
      expect(HoleResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['holes'])
      expect(d.map(&:id)).to match_array([hole1.id, hole2.id])
    end
  end
end
