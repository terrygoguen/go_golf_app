require 'rails_helper'

RSpec.describe "tee_boxes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/tee_boxes/#{tee_box.id}", payload
  end

  describe 'basic update' do
    let!(:tee_box) { create(:tee_box) }

    let(:payload) do
      {
        data: {
          id: tee_box.id.to_s,
          type: 'tee_boxes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TeeBoxResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { tee_box.reload.attributes }
    end
  end
end
