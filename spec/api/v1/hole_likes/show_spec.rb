require "rails_helper"

RSpec.describe "hole_likes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/hole_likes/#{hole_like.id}", params: params
  end

  describe "basic fetch" do
    let!(:hole_like) { create(:hole_like) }

    it "works" do
      expect(HoleLikeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("hole_likes")
      expect(d.id).to eq(hole_like.id)
    end
  end
end
