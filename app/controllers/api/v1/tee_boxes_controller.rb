class Api::V1::TeeBoxesController < Api::V1::GraphitiController
  def index
    tee_boxes = TeeBoxResource.all(params)
    respond_with(tee_boxes)
  end

  def show
    tee_box = TeeBoxResource.find(params)
    respond_with(tee_box)
  end

  def create
    tee_box = TeeBoxResource.build(params)

    if tee_box.save
      render jsonapi: tee_box, status: 201
    else
      render jsonapi_errors: tee_box
    end
  end

  def update
    tee_box = TeeBoxResource.find(params)

    if tee_box.update_attributes
      render jsonapi: tee_box
    else
      render jsonapi_errors: tee_box
    end
  end

  def destroy
    tee_box = TeeBoxResource.find(params)

    if tee_box.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: tee_box
    end
  end
end
