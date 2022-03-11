require "rails_helper"

RSpec.describe "holes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/holes/#{hole.id}"
  end

  describe "basic destroy" do
    let!(:hole) { create(:hole) }

    it "updates the resource" do
      expect(HoleResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Hole.count }.by(-1)
      expect { hole.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
