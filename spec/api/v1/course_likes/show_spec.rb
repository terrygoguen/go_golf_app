require 'rails_helper'

RSpec.describe "course_likes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/course_likes/#{course_like.id}", params: params
  end

  describe 'basic fetch' do
    let!(:course_like) { create(:course_like) }

    it 'works' do
      expect(CourseLikeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('course_likes')
      expect(d.id).to eq(course_like.id)
    end
  end
end
