require "rails_helper"

RSpec.describe "couses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/couses/#{couse.id}", params: params
  end

  describe "basic fetch" do
    let!(:couse) { create(:couse) }

    it "works" do
      expect(CouseResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("couses")
      expect(d.id).to eq(couse.id)
    end
  end
end
