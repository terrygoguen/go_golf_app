class CourseLikesController < ApplicationController
  before_action :set_course_like, only: [:show, :edit, :update, :destroy]

  # GET /course_likes
  def index
    @course_likes = CourseLike.all
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
      redirect_to @course_like, notice: 'Course like was successfully created.'
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
    redirect_to course_likes_url, notice: 'Course like was successfully destroyed.'
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
