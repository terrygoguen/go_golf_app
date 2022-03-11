class TeeBoxesController < ApplicationController
  before_action :set_tee_box, only: [:show, :edit, :update, :destroy]

  # GET /tee_boxes
  def index
    @tee_boxes = TeeBox.all
  end

  # GET /tee_boxes/1
  def show
  end

  # GET /tee_boxes/new
  def new
    @tee_box = TeeBox.new
  end

  # GET /tee_boxes/1/edit
  def edit
  end

  # POST /tee_boxes
  def create
    @tee_box = TeeBox.new(tee_box_params)

    if @tee_box.save
      message = 'TeeBox was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @tee_box, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /tee_boxes/1
  def update
    if @tee_box.update(tee_box_params)
      redirect_to @tee_box, notice: 'Tee box was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tee_boxes/1
  def destroy
    @tee_box.destroy
    message = "TeeBox was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to tee_boxes_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tee_box
      @tee_box = TeeBox.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tee_box_params
      params.require(:tee_box).permit(:hole_id, :color, :yardage)
    end
end
