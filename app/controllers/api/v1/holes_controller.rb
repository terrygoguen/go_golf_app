class Api::V1::HolesController < Api::V1::GraphitiController
  def index
    holes = HoleResource.all(params)
    respond_with(holes)
  end

  def show
    hole = HoleResource.find(params)
    respond_with(hole)
  end

  def create
    hole = HoleResource.build(params)

    if hole.save
      render jsonapi: hole, status: 201
    else
      render jsonapi_errors: hole
    end
  end

  def update
    hole = HoleResource.find(params)

    if hole.update_attributes
      render jsonapi: hole
    else
      render jsonapi_errors: hole
    end
  end

  def destroy
    hole = HoleResource.find(params)

    if hole.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: hole
    end
  end
end
