require 'rails_helper'

RSpec.describe "hole_likes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/hole_likes/#{hole_like.id}"
  end

  describe 'basic destroy' do
    let!(:hole_like) { create(:hole_like) }

    it 'updates the resource' do
      expect(HoleLikeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { HoleLike.count }.by(-1)
      expect { hole_like.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
