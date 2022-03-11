require "rails_helper"

RSpec.describe "course_likes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/course_likes/#{course_like.id}", payload
  end

  describe "basic update" do
    let!(:course_like) { create(:course_like) }

    let(:payload) do
      {
        data: {
          id: course_like.id.to_s,
          type: "course_likes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CourseLikeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { course_like.reload.attributes }
    end
  end
end
