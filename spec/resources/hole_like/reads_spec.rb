require "rails_helper"

RSpec.describe HoleLikeResource, type: :resource do
  describe "serialization" do
    let!(:hole_like) { create(:hole_like) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(hole_like.id)
      expect(data.jsonapi_type).to eq("hole_likes")
    end
  end

  describe "filtering" do
    let!(:hole_like1) { create(:hole_like) }
    let!(:hole_like2) { create(:hole_like) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: hole_like2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([hole_like2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:hole_like1) { create(:hole_like) }
      let!(:hole_like2) { create(:hole_like) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      hole_like1.id,
                                      hole_like2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      hole_like2.id,
                                      hole_like1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
