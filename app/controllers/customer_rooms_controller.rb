class CustomerRoomsController < ApplicationController
  before_action :set_customer_room, only: [:show, :update, :destroy]

  # GET /customer_rooms
  def index
    @customer_rooms = CustomerRoom.all

    render json: @customer_rooms
  end

  # GET /customer_rooms/1
  def show
    render json: @customer_room
  end

  # POST /customer_rooms
  def create
    @customer_room = CustomerRoom.new(customer_room_params)

    if @customer_room.save
      render json: @customer_room, status: :created, location: @customer_room
    else
      render json: @customer_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer_rooms/1
  def update
    if @customer_room.update(customer_room_params)
      render json: @customer_room
    else
      render json: @customer_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer_rooms/1
  def destroy
    @customer_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_room
      @customer_room = CustomerRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_room_params
      params.require(:customer_room).permit(:customer_id, :room_id, :created_by, :updated_by)
    end
end
