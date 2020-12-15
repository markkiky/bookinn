class RoomAmenitiesController < ApplicationController
  before_action :set_room_amenity, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /room_amenities
  def index
    @room_amenities = RoomAmenity.all
    response = {
      status: 200,
      message: "All room amenities",
      data: @room_amenities
    }
    
    render json: response
  end

  # GET /room_amenities/1
  def show
    response = {
      status: 200,
      message: "Specific Room Amenity",
      data: @room_amenity
    }
    render json: response
  end

  # POST /room_amenities
  def create
    @room_amenity = RoomAmenity.new(room_amenity_params)

    if @room_amenity.save
      response = {
        status: 200,
        message: "Room amenity created successfully",
        data: @room_amenity
      }
      render json: response, status: :created, location: @room_amenity
    else
      response = {
        status: 200,
        message: "Failed to create Room Amenity",
        data: @room_amenity.errors
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /room_amenities/1
  def update
    if @room_amenity.update(room_amenity_params)
      response = {
        status: 200,
        message: "Room Amenity updated successfully",
        data: @room_amenity
      }
      render json: response
    else
      response = {
        status: 200,
        message: "Failed to update room amenity",
        data: @room_amenity.errors
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # DELETE /room_amenities/1
  def destroy
    @room_amenity.update(:is_active => '1')
    response = {
      status: 200,
      message: "Room Amenity deleted successfully",
      data: @room_amenity
    }
   
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
