class HotelAmenitiesController < ApplicationController
  before_action :set_hotel_amenity, only: [:show, :update, :destroy]

  # GET /hotel_amenities
  def index
    @hotel_amenities = HotelAmenity.all
    @response = {
      status: 200,
      message: "Hotel Amenities",
      data: @hotel_amenities,
    }
    render json: @response
  end

  # GET /hotel_amenities/1
  def show
    @response = {
      status: 200,
      message: "Hotel Amenities",
      data: @hotel_amenity,
    }
    render json: @response
  end

  # POST /hotel_amenities
  def create
    @hotel_amenity = HotelAmenity.new(hotel_amenity_params)

    if @hotel_amenity.save
      @response = {
        status: 200,
        message: "Hotel Amenities",
        data: @hotel_amenity,
      }
      render json: @response
      # render json: @hotel_amenity, status: :created, location: @hotel_amenity
    else
      @response = {
        status: 400,
        message: "error creating hotel amenity",
        data: @hotel_amenity.error,
      }
      render json: @response
      # render json: @hotel_amenity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotel_amenities/1
  def update
    if @hotel_amenity.update(hotel_amenity_params)
      @response = {
        status: 200,
        message: "Hotel Amenity Updated",
        data: @hotel_amenity,
      }
      render json: @response
      # render json: @hotel_amenity
    else
      @response = {
        status: 200,
        message: "Hotel Amenities",
        data: @hotel_amenity.errors,
      }
      render json: @response
      # render json: @hotel_amenity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotel_amenities/1
  def destroy
    @hotel_amenity.update(is_active: "0")
    @response = {
      status: 200,
      message: "Hotel Amenities",
      data: @hotel_amenity,
    }
    render json: @response
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel_amenity
    @hotel_amenity = HotelAmenity.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def hotel_amenity_params
    params.require(:hotel_amenity).permit(:hotel_amenity_id, :hotel_amenity_name, :hotel_amenity_description)
  end
end
