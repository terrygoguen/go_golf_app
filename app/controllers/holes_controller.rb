class HolesController < ApplicationController
  before_action :set_hole, only: %i[show edit update destroy]

  def index
    @q = Hole.ransack(params[:q])
    @holes = @q.result(distinct: true).includes(:course, :hole_likes,
                                                :tee_boxes).page(params[:page]).per(10)
  end

  def show
    @tee_box = TeeBox.new
    @hole_like = HoleLike.new
  end

  def new
    @hole = Hole.new
  end

  def edit; end

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

  def update
    if @hole.update(hole_params)
      redirect_to @hole, notice: "Hole was successfully updated."
    else
      render :edit
    end
  end

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

  def set_hole
    @hole = Hole.find(params[:id])
  end

  def hole_params
    params.require(:hole).permit(:yardage, :par, :handicap, :polygon_map,
                                 :center_of_green_longitude, :center_of_green_latitude, :course_id)
  end
end
