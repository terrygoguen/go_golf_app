class HoleLikesController < ApplicationController
  before_action :set_hole_like, only: [:show, :edit, :update, :destroy]

  # GET /hole_likes
  def index
    @hole_likes = HoleLike.page(params[:page]).per(10)
  end

  # GET /hole_likes/1
  def show
  end

  # GET /hole_likes/new
  def new
    @hole_like = HoleLike.new
  end

  # GET /hole_likes/1/edit
  def edit
  end

  # POST /hole_likes
  def create
    @hole_like = HoleLike.new(hole_like_params)

    if @hole_like.save
      message = 'HoleLike was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @hole_like, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /hole_likes/1
  def update
    if @hole_like.update(hole_like_params)
      redirect_to @hole_like, notice: 'Hole like was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hole_likes/1
  def destroy
    @hole_like.destroy
    message = "HoleLike was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to hole_likes_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hole_like
      @hole_like = HoleLike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hole_like_params
      params.require(:hole_like).permit(:user_id, :hole_id)
    end
end
