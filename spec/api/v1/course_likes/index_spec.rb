require "rails_helper"

RSpec.describe "course_likes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/course_likes", params: params
  end

  describe "basic fetch" do
    let!(:course_like1) { create(:course_like) }
    let!(:course_like2) { create(:course_like) }

    it "works" do
      expect(CourseLikeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["course_likes"])
      expect(d.map(&:id)).to match_array([course_like1.id, course_like2.id])
    end
  end
end
