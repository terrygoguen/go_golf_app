require "rails_helper"

RSpec.describe "course_likes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/course_likes/#{course_like.id}"
  end

  describe "basic destroy" do
    let!(:course_like) { create(:course_like) }

    it "updates the resource" do
      expect(CourseLikeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CourseLike.count }.by(-1)
      expect { course_like.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
