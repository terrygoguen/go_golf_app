require 'rails_helper'

RSpec.describe "hole_likes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/hole_likes/#{hole_like.id}", payload
  end

  describe 'basic update' do
    let!(:hole_like) { create(:hole_like) }

    let(:payload) do
      {
        data: {
          id: hole_like.id.to_s,
          type: 'hole_likes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(HoleLikeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { hole_like.reload.attributes }
    end
  end
end
