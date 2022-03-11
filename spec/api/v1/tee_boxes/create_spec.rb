require "rails_helper"

RSpec.describe "tee_boxes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/tee_boxes", payload
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
          type: "tee_boxes",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(TeeBoxResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { TeeBox.count }.by(1)
    end
  end
end
