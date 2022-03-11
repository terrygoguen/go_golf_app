class Api::V1::HoleLikesController < Api::V1::GraphitiController
  def index
    hole_likes = HoleLikeResource.all(params)
    respond_with(hole_likes)
  end

  def show
    hole_like = HoleLikeResource.find(params)
    respond_with(hole_like)
  end

  def create
    hole_like = HoleLikeResource.build(params)

    if hole_like.save
      render jsonapi: hole_like, status: 201
    else
      render jsonapi_errors: hole_like
    end
  end

  def update
    hole_like = HoleLikeResource.find(params)

    if hole_like.update_attributes
      render jsonapi: hole_like
    else
      render jsonapi_errors: hole_like
    end
  end

  def destroy
    hole_like = HoleLikeResource.find(params)

    if hole_like.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: hole_like
    end
  end
end
