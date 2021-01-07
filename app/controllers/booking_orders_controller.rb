class BookingOrdersController < ApplicationController
  before_action :set_booking_order, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /booking_orders
  def index
    @booking_orders = BookingOrder.all.where(:is_active => 1)
    @bookings = []
    @booking_orders.each do |booking_order|
      @booking = {
        booking_no: booking_order.booking_no,
        booking_order_id: booking_order.id,
        booking_order_date: booking_order.booking_order_date,
        booking_order_status_id: booking_order.booking_order_status,
        booking_order_status: Status.find_by(:id => booking_order.booking_order_status) ? Status.find_by(:id => booking_order.booking_order_status).status_description : "Status not defined",
        customer: Customer.find_by(:id => booking_order.customer_id) ? Customer.find_by(:id => booking_order.customer_id).names : "marcus garvey",
        total_applicants: booking_order.total_applicants,
        room_type_description: RoomType.find_by(:id => booking_order.room_type_id) ? RoomType.find_by(:id => booking_order.room_type_id).room_type_description : "Room Type not defined",
        stay_start_date: booking_order.stay_start_date,
        stay_end_date: booking_order.stay_end_date,
        billed: BookingOrder.booking_bills(booking_order.id).count > 0 ? true : false,
        bills: BookingOrder.booking_bills(booking_order.id).count > 0 ? BookingOrder.bills(booking_order.id) : [],
        customers: BookingOrder.booking_customer(booking_order.id),
        booking_details: booking_order.booking_order_details,
      }
      @bookings << @booking
    end
    response = {
      status: 200,
      message: "Booking orders and their customers",
      data: @bookings,
    }
    render json: response
  end

  # GET /booking_orders/1
  def show
    @bill_infos = BillInfo.where(:booking_order_id => @booking_order.id)
    response = {
      status: 200,
      message: "booking and customer",
      data: {
        status: 200,
        booking: @booking_order,
        booking_details: @booking_order.booking_order_details,
        bill: @bill_infos,
        bill_details: BillDetail.all.where(:bill_info_id => @bill_info_response),
        customers: BookingOrder.booking_customer(@booking_order.id),
      },
    }
    render json: response
  end

  # POST /booking_orders
  def create
    @booking_order = BookingOrder.new(booking_order_params)
    @booking_order.created_by = @current_user

    if @booking_order.save
      render json: @booking_order, status: :created, location: @booking_order
    else
      render json: @booking_order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booking_orders/1
  def update
    if @booking_order.update(booking_order_params)
      render json: @booking_order
    else
      render json: @booking_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /booking_orders/1
  def destroy
    @booking_order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking_order
    @booking_order = BookingOrder.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def booking_order_params
    params.require(:booking_order).permit(:booking_order_id, :booking_order_date, :customer_id, :total_applicants, :room_type_id, :stay_start_date, :stay_end_date, :booking_order_status, :booking_order_type_id, :created_by, :updated_by)
  end
end
