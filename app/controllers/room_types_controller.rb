class RoomTypesController < ApplicationController
  before_action :set_room_type, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /room_types
  def index
    @room_types = RoomType.all

    response = {
      status: 200,
      message: "All Room Types",
      data: @room_types
    }

    render json: response
  end

  # GET /room_types/1
  def show
    response = {
      status: 200,
      message: "A specific room type",
      data: @room_type
    }
    render json: response
  end

  # POST /room_types
  def create
    @room_type = RoomType.new(room_type_params)

    response = {
      status: 200,
      message: "Room Type created successfully",
      data: @room_type
    }

    if @room_type.save
      render json: response, status: :created, location: @room_type
    else
      render json: @room_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /room_types/1
  def update
    if @room_type.update(room_type_params)

      response = {
        status: 200,
        message: "Room Type updated successfully",
        data: @room_type
      }
      render json: response
    else
      render json: @room_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /room_types/1
  def destroy
    @room_type.destroy
    response = {
      status: 200,
      message: "Room Type deleted successfully",
      data: @room_type
    }
    render json: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type
      @room_type = RoomType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_type_params
      params.require(:room_type).permit(:room_type_id, :room_type_description, :room_type_status, :room_type_total, :is_active, :created_by, :updated_by)
    end
end
