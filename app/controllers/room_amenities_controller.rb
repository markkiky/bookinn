class RoomAmenitiesController < ApplicationController
  before_action :set_room_amenity, only: [:show, :update, :destroy]

  # GET /room_amenities
  def index
    @room_amenities = RoomAmenity.all

    render json: @room_amenities
  end

  # GET /room_amenities/1
  def show
    render json: @room_amenity
  end

  # POST /room_amenities
  def create
    @room_amenity = RoomAmenity.new(room_amenity_params)

    if @room_amenity.save
      render json: @room_amenity, status: :created, location: @room_amenity
    else
      render json: @room_amenity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /room_amenities/1
  def update
    if @room_amenity.update(room_amenity_params)
      render json: @room_amenity
    else
      render json: @room_amenity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /room_amenities/1
  def destroy
    @room_amenity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_amenity
      @room_amenity = RoomAmenity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_amenity_params
      params.require(:room_amenity).permit(:room_amenity_id, :room_amenity_name, :room_amenity_description)
    end
end
