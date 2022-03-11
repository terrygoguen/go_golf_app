class HolesController < ApplicationController
  before_action :set_hole, only: %i[show edit update destroy]

  # GET /holes
  def index
    @q = Hole.ransack(params[:q])
    @holes = @q.result(distinct: true).includes(:course, :hole_likes,
                                                :tee_boxes).page(params[:page]).per(10)
  end

  # GET /holes/1
  def show
    @tee_box = TeeBox.new
    @hole_like = HoleLike.new
  end

  # GET /holes/new
  def new
    @hole = Hole.new
  end

  # GET /holes/1/edit
  def edit; end

  # POST /holes
  def create
    @hole = Hole.new(hole_params)

    if @hole.save
      message = "Hole was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @hole, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /holes/1
  def update
    if @hole.update(hole_params)
      redirect_to @hole, notice: "Hole was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /holes/1
  def destroy
    @hole.destroy
    message = "Hole was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to holes_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hole
    @hole = Hole.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def hole_params
    params.require(:hole).permit(:yardage, :par, :handicap, :polygon_map,
                                 :center_of_green_longitude, :center_of_green_latitude, :course_id)
  end
end
