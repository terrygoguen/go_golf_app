require 'rails_helper'

RSpec.describe "holes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/holes/#{hole.id}", params: params
  end

  describe 'basic fetch' do
    let!(:hole) { create(:hole) }

    it 'works' do
      expect(HoleResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('holes')
      expect(d.id).to eq(hole.id)
    end
  end
end
