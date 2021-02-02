class UnitOfMeasuresController < ApplicationController
  before_action :set_unit_of_measure, only: [:show, :update, :destroy]

  # GET /unit_of_measures
  def index
    @unit_of_measures = UnitOfMeasure.all.where(is_active: "1")

    @response = {
      status: 200,
      message: "success",
      data: @unit_of_measures,
    }
    render json: @response
  end

  # GET /unit_of_measures/1
  def show
    @response = {
      status: 200,
      message: "success",
      data: @unit_of_measure,
    }
    render json: @response
  end

  # POST /unit_of_measures
  def create
    @unit_of_measure = UnitOfMeasure.new(unit_of_measure_params)

    if @unit_of_measure.save
      @response = {
        status: 200,
        message: "success",
        data: @unit_of_measure,
      }
      render json: @response
      # render json: @unit_of_measure, status: :created, location: @unit_of_measure
    else
      @response = {
        status: 400,
        message: "error",
        data: @unit_of_measure.errors,
      }
      render json: @response
      # render json: @unit_of_measure.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /unit_of_measures/1
  def update
    if @unit_of_measure.update(unit_of_measure_params)
      @response = {
        status: 200,
        message: "success",
        data: @unit_of_measure,
      }
      render json: @response
      # render json: @unit_of_measure
    else
      @response = {
        status: 400,
        message: "error",
        data: @unit_of_measure.errors,
      }
      render json: @response
      # render json: @unit_of_measure.errors, status: :unprocessable_entity
    end
  end

  # DELETE /unit_of_measures/1
  def destroy
    @unit_of_measure.update(is_active: "0")
    @response = {
        status: 200,
        message: "success",
        data: @unit_of_measure,
      }
      render json: @response
    # @unit_of_measure.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_unit_of_measure
    @unit_of_measure = UnitOfMeasure.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def unit_of_measure_params
    params.require(:unit_of_measure).permit(:unit_id, :unit_description, :unit_status, :created_by, :updated_by)
  end
end
