class HoleLikesController < ApplicationController
  before_action :set_hole_like, only: %i[show edit update destroy]

  def index
    @q = HoleLike.ransack(params[:q])
    @hole_likes = @q.result(distinct: true).includes(:user,
                                                     :hole).page(params[:page]).per(10)
  end

  def show; end

  def new
    @hole_like = HoleLike.new
  end

  def edit; end

  def create
    @hole_like = HoleLike.new(hole_like_params)

    if @hole_like.save
      message = "HoleLike was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @hole_like, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @hole_like.update(hole_like_params)
      redirect_to @hole_like, notice: "Hole like was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @hole_like.destroy
    message = "HoleLike was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to hole_likes_url, notice: message
    end
  end

  private

  def set_hole_like
    @hole_like = HoleLike.find(params[:id])
  end

  def hole_like_params
    params.require(:hole_like).permit(:user_id, :hole_id)
  end
end
