class TeeBoxesController < ApplicationController
  before_action :set_tee_box, only: %i[show edit update destroy]

  def index
    @q = TeeBox.ransack(params[:q])
    @tee_boxes = @q.result(distinct: true).includes(:hole).page(params[:page]).per(10)
  end

  def show; end

  def new
    @tee_box = TeeBox.new
  end

  def edit; end

  def create
    @tee_box = TeeBox.new(tee_box_params)

    if @tee_box.save
      message = "TeeBox was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @tee_box, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @tee_box.update(tee_box_params)
      redirect_to @tee_box, notice: "Tee box was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tee_box.destroy
    message = "TeeBox was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to tee_boxes_url, notice: message
    end
  end

  private

  def set_tee_box
    @tee_box = TeeBox.find(params[:id])
  end

  def tee_box_params
    params.require(:tee_box).permit(:hole_id, :color, :yardage)
  end
end
