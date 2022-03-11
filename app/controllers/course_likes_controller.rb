class CourseLikesController < ApplicationController
  before_action :set_course_like, only: %i[show edit update destroy]

  def index
    @q = CourseLike.ransack(params[:q])
    @course_likes = @q.result(distinct: true).includes(:user,
                                                       :course).page(params[:page]).per(10)
  end

  def show; end

  def new
    @course_like = CourseLike.new
  end

  def edit; end

  def create
    @course_like = CourseLike.new(course_like_params)

    if @course_like.save
      message = "CourseLike was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @course_like, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @course_like.update(course_like_params)
      redirect_to @course_like, notice: "Course like was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @course_like.destroy
    message = "CourseLike was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to course_likes_url, notice: message
    end
  end

  private

  def set_course_like
    @course_like = CourseLike.find(params[:id])
  end

  def course_like_params
    params.require(:course_like).permit(:user_id, :course_id)
  end
end
