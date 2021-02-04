class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /rooms
  def index
    @rooms = Room.all.where(:is_active => 1)
    @rumus = []
    @rooms.each do |room|
      @room_type = Room.room_type(room.id)

      @room = {
        id: room.id,
        room_no: room.room_no,
        room_type: room.room_type.room_type_description,
        date_created: room.created_at,
        last_occupied: room.updated_at,
        created_by: "Mr Me",
        room_name: room.room_name,
        room_price: room.room_price,
        capacity: room.capacity,
        room_status: room.status,
        room_type_id: @room_type.id,
        room_type_description: @room_type.room_type_description,
        room_type_status: @room_type.room_type_status,
        room_type_total: @room_type.room_type_total,

        hotel_name: Hotel.find(room.hotel_id).hotel_name,
        hotel_wing: HotelWing.find(room.hotel_wing_id).wing_description,
      }
      @rumus << @room
    end
    response = {
      status: 200,
      message: "All Rooms",
      data: @rumus,
    }

    render json: response
  end

  # GET /rooms/1
  def show
    @room_type = Room.room_type(@room.id)
    @rumu = {
      id: @room.id,
      room_no: @room.room_no,
      room_name: @room.room_name,
      room_price: @room.room_price,
      room_status: @room.status,
      room_is_active: @room.is_active,
      room_type_id: @room_type.id,
      room_type_description: @room_type.room_type_description,
      room_type_status: @room_type.room_type_status,
      room_type_total: @room_type.room_type_total,
    }
    response = {
      status: 200,
      message: "A specific room",
      data: @rumu,
    }
    render json: response
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)
    # @room.hotel_id = @current_user["hotel_id"] ? @current_user["hotel_id"] : "1"

    if @room.save!
      @response = {
        status: 200,
        message: "Room created successfully",
        data: @room,
      }
      render json: @response, status: :created, location: @room
    else
      @response = {
        status: 400,
        message: @room.errors,
        data: [],
      }
      render json: @response
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      @room_type = Room.room_type(@room.id)
      @rumu = {
        id: @room.id,
        room_no: @room.room_no,
        room_name: @room.room_name,
        room_price: @room.room_price,
        room_status: @room.status,
        room_type_id: @room_type.id,
        room_type_description: @room_type.room_type_description,
        room_type_status: @room_type.room_type_status,
        room_type_total: @room_type.room_type_total,
      }
      response = {
        status: 200,
        message: "Room updated successfully",
        data: @rumu,
      }
      render json: response
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.update(:is_active => 0)
    @room_type = Room.room_type(@room.id)
    @rumu = {
      id: @room.id,
      room_no: @room.room_no,
      room_name: @room.room_name,
      room_price: @room.room_price,
      room_status: @room.status,
      room_type_id: @room_type.id,
      room_type_description: @room_type.room_type_description,
      room_type_status: @room_type.room_type_status,
      room_type_total: @room_type.room_type_total,
    }
    response = {
      status: 200,
      message: "Room deleted successfully",
      data: @rumu,
    }
    # @room.destroy

    render json: response
  end

  # return rooms with status available
  # return available rooms of a particular type
  def get_rooms_by_status_by_room_type
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def room_params
    params.permit(:hotel_id, :hotel_wing_id, :room_id, :room_no, :room_name, :room_type_id, :room_price, :status, :is_active)
  end
end
