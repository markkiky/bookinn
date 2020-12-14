class BookingOrderDetailsController < ApplicationController
  before_action :set_booking_order_detail, only: [:show, :update, :destroy]

  # GET /booking_order_details
  def index
    @booking_order_details = BookingOrderDetail.all

    render json: @booking_order_details
  end

  # GET /booking_order_details/1
  def show
    render json: @booking_order_detail
  end

  # POST /booking_order_details
  def create
    @booking_order_detail = BookingOrderDetail.new(booking_order_detail_params)

    if @booking_order_detail.save
      render json: @booking_order_detail, status: :created, location: @booking_order_detail
    else
      render json: @booking_order_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booking_order_details/1
  def update
    if @booking_order_detail.update(booking_order_detail_params)
      render json: @booking_order_detail
    else
      render json: @booking_order_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /booking_order_details/1
  def destroy
    @booking_order_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_order_detail
      @booking_order_detail = BookingOrderDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_order_detail_params
      params.require(:booking_order_detail).permit(:booking_order_id, :room_type_id, :stay_start_date, :stay_end_date)
    end
end
