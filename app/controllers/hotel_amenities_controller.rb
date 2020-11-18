class HotelAmenitiesController < ApplicationController
  before_action :set_hotel_amenity, only: [:show, :update, :destroy]

  # GET /hotel_amenities
  def index
    @hotel_amenities = HotelAmenity.all

    render json: @hotel_amenities
  end

  # GET /hotel_amenities/1
  def show
    render json: @hotel_amenity
  end

  # POST /hotel_amenities
  def create
    @hotel_amenity = HotelAmenity.new(hotel_amenity_params)

    if @hotel_amenity.save
      render json: @hotel_amenity, status: :created, location: @hotel_amenity
    else
      render json: @hotel_amenity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotel_amenities/1
  def update
    if @hotel_amenity.update(hotel_amenity_params)
      render json: @hotel_amenity
    else
      render json: @hotel_amenity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotel_amenities/1
  def destroy
    @hotel_amenity.destroy
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
