require 'rails_helper'

RSpec.describe "couses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/couses/#{couse.id}"
  end

  describe 'basic destroy' do
    let!(:couse) { create(:couse) }

    it 'updates the resource' do
      expect(CouseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Couse.count }.by(-1)
      expect { couse.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
