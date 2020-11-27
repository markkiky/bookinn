class RoomTypesController < ApplicationController
  before_action :set_room_type, only: [:show, :update, :destroy]

  # GET /room_types
  def index
    @room_types = RoomType.all

    render json: @room_types
  end

  # GET /room_types/1
  def show
    render json: @room_type
  end

  # POST /room_types
  def create
    @room_type = RoomType.new(room_type_params)

    if @room_type.save
      render json: @room_type, status: :created, location: @room_type
    else
      render json: @room_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /room_types/1
  def update
    if @room_type.update(room_type_params)
      render json: @room_type
    else
      render json: @room_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /room_types/1
  def destroy
    @room_type.destroy
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
