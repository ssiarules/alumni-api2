class AlumniController < ApplicationController
  before_action :set_alumnu, only: [:show, :update, :destroy]

  # GET /alumnis
  def index
    @alumni = Alumni.all

    render json: @alumni
  end

  # GET /alumnis/1
  def show

    alumni = Alumni.find(params[:id])
    render json: @alumni
  end

  # POST /alumnis
  def create
    @alumni = Alumni.new(alumni_params)
    #binding.pry

    if @alumni.save
      render json: @alumni, status: :created, location: @alumni
    else
      render json: @alumni.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alumnis/1
  def update
      alumni = Alumni.find(params[:id])

    if @alumni.update(alumni_params)
      render json: @alumni
    else
      render json: @alumni.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alumnis/1
  def destroy

   alumni = Alumni.find(params[:id])


    if @alumni.destroy
      render json: alumni.id
    else
      render json: @alumni.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumni
      @alumni = Alumni.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alumni_params
      params.require(:alumni).permit(:name, :yearGraduated, :college, :profession, :sportPlayedInHighSchool, :currentlyLiving, :hobbies)
    end

    
end
