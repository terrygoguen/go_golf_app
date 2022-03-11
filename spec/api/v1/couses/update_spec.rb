require "rails_helper"

RSpec.describe "couses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/couses/#{couse.id}", payload
  end

  describe "basic update" do
    let!(:couse) { create(:couse) }

    let(:payload) do
      {
        data: {
          id: couse.id.to_s,
          type: "couses",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CouseResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { couse.reload.attributes }
    end
  end
end
