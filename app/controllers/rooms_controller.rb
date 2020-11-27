class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all

    render json: @rooms
  end

  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  # GET /room/available
  def available
    puts params
    
    if params[:start_date].blank? && params[:end_date].blank? && params[:room_type_id].blank?
      @rooms = Room.all
      response = {
        status: 200,
        message: "All Available rooms",
        data: @rooms
      }
    elsif params[:start_date].blank?
      @rooms = Room.all
      response = {
        status: 200,
        message: "All Available rooms",
        data: @rooms
      }
    end
    # byebug
    
    render json: response
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
