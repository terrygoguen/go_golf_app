class CousesController < ApplicationController
  before_action :set_couse, only: %i[show edit update destroy]

  # GET /couses
  def index
    @q = Couse.ransack(params[:q])
    @couses = @q.result(distinct: true).includes(:holes,
                                                 :course_likes).page(params[:page]).per(10)
  end

  # GET /couses/1
  def show
    @course_like = CourseLike.new
    @hole = Hole.new
  end

  # GET /couses/new
  def new
    @couse = Couse.new
  end

  # GET /couses/1/edit
  def edit; end

  # POST /couses
  def create
    @couse = Couse.new(couse_params)

    if @couse.save
      redirect_to @couse, notice: "Couse was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /couses/1
  def update
    if @couse.update(couse_params)
      redirect_to @couse, notice: "Couse was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /couses/1
  def destroy
    @couse.destroy
    redirect_to couses_url, notice: "Couse was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_couse
    @couse = Couse.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def couse_params
    params.require(:couse).permit(:name, :address, :phone_number, :rating,
                                  :handicap, :longitude, :latitude)
  end
end
