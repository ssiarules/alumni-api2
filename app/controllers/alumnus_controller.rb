class AlumnusController < ApplicationController
  before_action :set_alumnu, only: [:show, :update, :destroy]

  # GET /alumnus
  def index
    @alumnus = Alumnu.all

    render json: @alumnus
  end

  # GET /alumnus/1
  def show
    render json: @alumnu
  end

  # POST /alumnus
  def create
    @alumnu = Alumnu.new(alumnu_params)

    if @alumnu.save
      render json: @alumnu, status: :created, location: @alumnu
    else
      render json: @alumnu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alumnus/1
  def update
    if @alumnu.update(alumnu_params)
      render json: @alumnu
    else
      render json: @alumnu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alumnus/1
  def destroy
    @alumnu.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumnu
      @alumnu = Alumnu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alumnu_params
      params.require(:alumnu).permit(:name, :yearGraduated, :college, :profession, :sportPlayedInHighSchool, :currentlyLiving, :hobbies)
    end
end
