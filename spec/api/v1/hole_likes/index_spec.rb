require "rails_helper"

RSpec.describe "hole_likes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/hole_likes", params: params
  end

  describe "basic fetch" do
    let!(:hole_like1) { create(:hole_like) }
    let!(:hole_like2) { create(:hole_like) }

    it "works" do
      expect(HoleLikeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["hole_likes"])
      expect(d.map(&:id)).to match_array([hole_like1.id, hole_like2.id])
    end
  end
end
