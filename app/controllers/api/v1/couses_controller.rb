class Api::V1::CousesController < Api::V1::GraphitiController
  def index
    couses = CouseResource.all(params)
    respond_with(couses)
  end

  def show
    couse = CouseResource.find(params)
    respond_with(couse)
  end

  def create
    couse = CouseResource.build(params)

    if couse.save
      render jsonapi: couse, status: :created
    else
      render jsonapi_errors: couse
    end
  end

  def update
    couse = CouseResource.find(params)

    if couse.update_attributes
      render jsonapi: couse
    else
      render jsonapi_errors: couse
    end
  end

  def destroy
    couse = CouseResource.find(params)

    if couse.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: couse
    end
  end
end
