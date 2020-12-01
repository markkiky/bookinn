class CustomerBookingsController < ApplicationController
  before_action :set_customer_booking, only: [:show, :update, :destroy]

  # GET /customer_bookings
  def index
    @customer_bookings = CustomerBooking.all

    render json: @customer_bookings
  end

  # GET /customer_bookings/1
  def show
    render json: @customer_booking
  end

  # POST /customer_bookings
  def create
    @customer_booking = CustomerBooking.new(customer_booking_params)

    if @customer_booking.save
      render json: @customer_booking, status: :created, location: @customer_booking
    else
      render json: @customer_booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer_bookings/1
  def update
    if @customer_booking.update(customer_booking_params)
      render json: @customer_booking
    else
      render json: @customer_booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer_bookings/1
  def destroy
    @customer_booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_booking
      @customer_booking = CustomerBooking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_booking_params
      params.require(:customer_booking).permit(:customer_id, :booking_order_id, :is_active, :created_by, :updated_by)
    end
end
