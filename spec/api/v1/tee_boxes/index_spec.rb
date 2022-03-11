require "rails_helper"

RSpec.describe "tee_boxes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tee_boxes", params: params
  end

  describe "basic fetch" do
    let!(:tee_box1) { create(:tee_box) }
    let!(:tee_box2) { create(:tee_box) }

    it "works" do
      expect(TeeBoxResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["tee_boxes"])
      expect(d.map(&:id)).to match_array([tee_box1.id, tee_box2.id])
    end
  end
end
