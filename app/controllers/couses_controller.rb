class CousesController < ApplicationController
  before_action :set_couse, only: %i[show edit update destroy]

  def index
    @q = Couse.ransack(params[:q])
    @couses = @q.result(distinct: true).includes(:holes,
                                                 :course_likes).page(params[:page]).per(10)
  end

  def show
    @course_like = CourseLike.new
    @hole = Hole.new
  end

  def new
    @couse = Couse.new
  end

  def edit; end

  def create
    @couse = Couse.new(couse_params)

    if @couse.save
      redirect_to @couse, notice: "Couse was successfully created."
    else
      render :new
    end
  end

  def update
    if @couse.update(couse_params)
      redirect_to @couse, notice: "Couse was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @couse.destroy
    redirect_to couses_url, notice: "Couse was successfully destroyed."
  end

  private

  def set_couse
    @couse = Couse.find(params[:id])
  end

  def couse_params
    params.require(:couse).permit(:name, :address, :phone_number, :rating,
                                  :handicap, :longitude, :latitude)
  end
end
