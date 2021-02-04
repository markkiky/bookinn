class HotelWingsController < ApplicationController
  before_action :set_hotel_wing, only: [:show, :update, :destroy]

  # GET /hotel_wings
  def index
    @hotel_wings = HotelWing.all

    @response = {
      status: 200,
      message: "hotel wings",
      data: @hotel_wings,
    }
    render json: @response
  end

  # GET /hotel_wings/1
  def show
    @response = {
      status: 200,
      message: "hotel wings",
      data: @hotel_wing,
    }
    render json: @response
    # render json: @hotel_wing
  end

  # POST /hotel_wings
  def create
    @hotel_wing = HotelWing.new(hotel_wing_params)

    if @hotel_wing.save
      @response = {
        status: 200,
        message: "hotel wing",
        data: @hotel_wing,
      }
      render json: @response
      # render json: @hotel_wing, status: :created, location: @hotel_wing
    else
      @response = {
        status: 400,
        message: "failed",
        data: @hotel_wing.errors,
      }
      # render json: @hotel_wing.errors, status: :unprocessable_entity
      render json: @response
    end
  end

  # PATCH/PUT /hotel_wings/1
  def update
    if @hotel_wing.update(hotel_wing_params)
      @response = {
        status: 200,
        message: "hotel wing",
        data: @hotel_wing,
      }
      render json: @response
    else
      @response = {
        status: 400,
        message: "failed",
        data: @hotel_wing.errors,
      }
      # render json: @hotel_wing.errors, status: :unprocessable_entity
      render json: @response
    end
  end

  # DELETE /hotel_wings/1
  def destroy
    @hotel_wing.update(is_active: "0")
    @response = {
      status: 200,
      message: "Deleted",
      data: @hotel_wing,
    }

    render json: @hotel_wing
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel_wing
    @hotel_wing = HotelWing.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def hotel_wing_params
    params.require(:hotel_wing).permit(:hotel_wing_id, :wing_description, :hotel_wing_status, :created_by, :updated_by)
  end
end
