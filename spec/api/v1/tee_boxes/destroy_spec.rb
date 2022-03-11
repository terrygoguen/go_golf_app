require 'rails_helper'

RSpec.describe "tee_boxes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/tee_boxes/#{tee_box.id}"
  end

  describe 'basic destroy' do
    let!(:tee_box) { create(:tee_box) }

    it 'updates the resource' do
      expect(TeeBoxResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { TeeBox.count }.by(-1)
      expect { tee_box.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
