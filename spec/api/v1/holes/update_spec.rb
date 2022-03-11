require 'rails_helper'

RSpec.describe "holes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/holes/#{hole.id}", payload
  end

  describe 'basic update' do
    let!(:hole) { create(:hole) }

    let(:payload) do
      {
        data: {
          id: hole.id.to_s,
          type: 'holes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(HoleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { hole.reload.attributes }
    end
  end
end
