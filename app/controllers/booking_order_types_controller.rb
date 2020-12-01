class BookingOrderTypesController < ApplicationController
  before_action :set_booking_order_type, only: [:show, :update, :destroy]

  # GET /booking_order_types
  def index
    @booking_order_types = BookingOrderType.all

    render json: @booking_order_types
  end

  # GET /booking_order_types/1
  def show
    render json: @booking_order_type
  end

  # POST /booking_order_types
  def create
    @booking_order_type = BookingOrderType.new(booking_order_type_params)

    if @booking_order_type.save
      render json: @booking_order_type, status: :created, location: @booking_order_type
    else
      render json: @booking_order_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booking_order_types/1
  def update
    if @booking_order_type.update(booking_order_type_params)
      render json: @booking_order_type
    else
      render json: @booking_order_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /booking_order_types/1
  def destroy
    @booking_order_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_order_type
      @booking_order_type = BookingOrderType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_order_type_params
      params.require(:booking_order_type).permit(:booking_order_type_id, :booking_order_type_description, :booking_order_type_status)
    end
end
