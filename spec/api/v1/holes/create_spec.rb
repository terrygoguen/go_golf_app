require "rails_helper"

RSpec.describe "holes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/holes", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "holes",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(HoleResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Hole.count }.by(1)
    end
  end
end
