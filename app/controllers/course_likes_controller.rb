class CourseLikesController < ApplicationController
  before_action :set_course_like, only: [:show, :edit, :update, :destroy]

  # GET /course_likes
  def index
    @q = CourseLike.ransack(params[:q])
    @course_likes = @q.result(:distinct => true).includes(:user, :course).page(params[:page]).per(10)
  end

  # GET /course_likes/1
  def show
  end

  # GET /course_likes/new
  def new
    @course_like = CourseLike.new
  end

  # GET /course_likes/1/edit
  def edit
  end

  # POST /course_likes
  def create
    @course_like = CourseLike.new(course_like_params)

    if @course_like.save
      message = 'CourseLike was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @course_like, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /course_likes/1
  def update
    if @course_like.update(course_like_params)
      redirect_to @course_like, notice: 'Course like was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /course_likes/1
  def destroy
    @course_like.destroy
    message = "CourseLike was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to course_likes_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_like
      @course_like = CourseLike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_like_params
      params.require(:course_like).permit(:user_id, :course_id)
    end
end
