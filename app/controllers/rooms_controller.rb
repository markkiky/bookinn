class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all
    @rumus = []
    @rooms.each do |room|
      @room = {
        room: room,
        room_type: Room.room_type(room.id),
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
    response = {
      status: 200,
      message: "A specific room",
      data: {
        room: @room,
        room_type: Room.room_type(@room.id)
      }
    }
    render json: response
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)
    response = {
      status: 200,
      message: "Room created successfully",
      data: @room
    }
    if @room.save
      render json: response, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    response = {
      status: 200,
      message: "Room updated successfully",
      data: @room,
    }
    if @room.update(room_params)
      render json: response
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    response = {
      status: 200,
      message: "Room deleted successfully",
      data: @room,
    }
    @room.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def room_params
    params.require(:room).permit(:room_id, :room_no, :room_name, :room_type_id)
  end
end
