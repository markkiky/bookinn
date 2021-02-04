class HotelWingsController < ApplicationController
  before_action :set_hotel_wing, only: [:show, :update, :destroy]

  # GET /hotel_wings
  def index
    @hotel_wings = HotelWing.all

    @response = {
      status: 200,
      message: "All Hotel Wings",
      data: @hotel_wings,
    }

    render json: @response
  end

  # GET /hotel_wings/1
  def show
    render json: @hotel_wing
  end

  # POST /hotel_wings
  def create
    @hotel_wing = HotelWing.new(hotel_wing_params)

    if @hotel_wing.save
      render json: @hotel_wing, status: :created, location: @hotel_wing
    else
      render json: @hotel_wing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotel_wings/1
  def update
    if @hotel_wing.update(hotel_wing_params)
      render json: @hotel_wing
    else
      render json: @hotel_wing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotel_wings/1
  def destroy
    @hotel_wing.destroy
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
