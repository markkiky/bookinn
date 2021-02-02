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
        customer_id: Customer.find(booking_order.customer_id).id,
        total_applicants: BookingOrder.total_applicants(booking_order.id),
        room_type_description: RoomType.find_by(:id => booking_order.room_type_id) ? RoomType.find_by(:id => booking_order.room_type_id).room_type_description : "Room Type not defined",
        stay_start_date: BookingOrder.stay_start_date(booking_order.id),
        stay_end_date: BookingOrder.stay_end_date(booking_order.id),
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
    @bill_info = BillInfo.find_by(booking_order_id: @booking_order.id)
    response = {
      status: 200,
      message: "booking and customer",
      data: {
        status: 200,
        booking: @booking_order,
        booking_details: @booking_order.booking_order_details,
        bill: @bill_info,
        bill_details: @bill_info.bill_details,
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

  #
  def walkin_bookinn
    begin
      @bill_infos = []
      BookingOrder.transaction do
        # byebug
        # each loop is an individual booking
        walkin_bookinn_params["booking"].each do |booking|
          # create booking order
          @booking_order = BookingOrder.create!(
            booking_order_id: BookingOrder.booking_order_id,
            booking_no: BookingOrder.booking_order_no,
            customer_id: booking["customer_id"],
            booking_order_type_id: booking["booking_order_type_id"],
            created_by: @current_user.id,
          )

          # create a bill for the booking_order
          @bill_info = BillInfo.create!(
            bill_no: BillInfo.bill_no,
            booking_order_id: @booking_order.id,
            bill_info_description: "Walkinn Bookinn",
            customer_id: booking["customer_id"],
            bill_date: Time.now,
            bill_total: "0",
            reducing_balance: "0",
            created_by: @current_user.id,
            bill_status: "15", #bill unpaid status
          )

          # create booking order details
          booking["booking_details"].each do |booking_detail|
            @room_type = RoomType.find(booking_detail["room_type_id"])
            @booking_order_detail = BookingOrderDetail.create!(
              booking_order_id: @booking_order.id,
              room_type_id: @room_type.id,
              total_applicants: booking_detail["total_applicants"],
              stay_start_date: booking_detail["stay_start_date"],
              stay_end_date: booking_detail["stay_end_date"],
              created_by: @current_user.id,
            )
            # create bill detail for the booking detail
            @bill_detail = BillDetail.create!(
              bill_no: @bill_info.bill_no,
              bill_info_id: @bill_info.id,
              room_type_id: @room_type.id,
              booking_order_detail_id: @booking_order_detail.id,
              bill_detail_description: @room_type.room_type_description,
              bill_item_id: @room_type.bill_item.id,
              bill_item_quantity: (@booking_order_detail.stay_end_date.to_date - @booking_order_detail.stay_start_date.to_date).to_i, # no of days
              bill_item_quantity2: @booking_order_detail.total_applicants,
              bill_item_rate: @room_type.bill_item.bill_item_rate,
              amount: BillInfo.calculate_fee(@room_type.bill_item.bill_item_rate.to_i, @booking_order_detail.total_applicants.to_i, (@booking_order_detail.stay_end_date.to_date - @booking_order_detail.stay_start_date.to_date).to_i),
            )

            @bill_info.update(
              bill_total: @bill_total.to_i + @bill_detail.amount.to_i,
              reducing_balance: @bill_total.to_i + @bill_detail.amount.to_i,
            )
          end

          @bill_infos << @bill_info
        end
      end
    rescue ActiveRecord::RecordInvalid => invalid
      @response = {
        status: 400,
        message: "Error creating booking order",
        data: invalid,
      }
    rescue ActiveRecord::RecordNotFound => invalid
      @response = {
        status: 400,
        message: "Record Not Found Error",
        data: invalid,
      }
    else
      @response = {
        status: 200,
        message: "Creating Walkin Bookinn",
        data: @bill_infos,
      }
    end

    render json: @response
  end

  def mass_booking
    begin
      BookingOrder.transaction do
      @customer = Customer.find(mass_booking_params["customer_id"])
      @channel = Channel.find(@customer.channel_id)
      @booking_order = BookingOrder.create!(
        booking_order_id: BookingOrder.booking_order_id,
        booking_order_date: Date.today,
        booking_no: BookingOrder.booking_order_no,
        customer_id: @customer.id,
        booking_order_type_id: "4",
        created_by: @current_user.id,
      )

      @channel_transaction = ChannelTransaction.create(
        :channel_transaction_id => ChannelTransaction.channel_transaction_id,
        :channel_transaction_date => Time.now,
        :channel_transaction_type => "",
        :channel_transaction_amount => "",
        :created_by => @current_user.id,
      )
      @bill_info = BillInfo.create!(
        bill_no: BillInfo.bill_no,
        booking_order_id: @booking_order.id,
        bill_info_description: "Mass Bookinn",
        customer_id: @customer.customer_id,
        bill_date: Time.now,
        bill_total: "0",
        reducing_balance: "0",
        created_by: @current_user.id,
        bill_status: "15", #bill unpaid status
        created_by: @current_user.id,
      )

      mass_booking_params["bookings"].each do |booking_detail|
        @room_type = RoomType.find(booking_detail["room_type_id"])
        @booking_order_detail = BookingOrderDetail.create!(
          booking_order_id: @booking_order.id,
          room_type_id: @room_type.id,
          total_applicants: booking_detail["total_applicants"],
          stay_start_date: booking_detail["stay_start_date"],
          stay_end_date: booking_detail["stay_end_date"],
          created_by: @current_user.id,
        )
        # byebug
        @bill_detail = BillDetail.create!(
          bill_no: @bill_info.bill_no,
          bill_info_id: @bill_info.id,
          room_type_id: @room_type.id,
          booking_order_detail_id: @booking_order_detail.id,
          bill_detail_description: "Room Transfer Bill: #{@room_type.room_type_description}",
          bill_item_id: @room_type.bill_item.id,
          bill_item_quantity: (@booking_order_detail.stay_end_date.to_date - @booking_order_detail.stay_start_date.to_date).to_i, # no of days
          bill_item_quantity2: @booking_order_detail.total_applicants,
          bill_item_rate: @room_type.bill_item.bill_item_rate,
          amount: BillInfo.calculate_fee(@room_type.bill_item.bill_item_rate.to_i, @booking_order_detail.total_applicants.to_i, (@booking_order_detail.stay_end_date.to_date - @booking_order_detail.stay_start_date.to_date).to_i),
          created_by: @current_user.id,
        )
        # update bill_info to retain any paid amount
        @bill_info.update!(
          bill_total: BillInfo.calculate_fee_sum_details(@bill_info.id),
          reducing_balance: BillInfo.updated_reducing_balance(@bill_info.id),
          updated_by: @current_user.id,
        )
      end
    end
    rescue Exception => invalid
      @response = {
        
        status: 400,
        message: "Error in mass booking",
        data: invalid,
      }
    rescue ActiveRecord::RecordInvalid => invalid
      @response = {
        status: 400,
        message: "Booking Transfer Error",
        data: invalid,
      }
    rescue ActiveRecord::RecordNotFound => invalid
      @response = {
        status: 400,
        message: "Record Not Found Error",
        data: invalid,
      }
    else
      @response = {
        status: 200,
        message: "Mass Booking created",
        data: {
          bill: @bill_info,
        },
      }
    end
    render json: @response
  end

  def booking_transfer
    begin
      BookingOrder.transaction do
        @booking_order = BookingOrder.find(booking_transfer_params["booking_order_id"])
        @bill_info = BillInfo.find_by(booking_order_id: @booking_order.id, is_active: "1")
        booking_transfer_params["booking_order_details"].each do |booking_detail|
          if !@booking_order.booking_order_detail_ids.include? booking_detail["booking_order_detail_id"]
            raise Exception.new "Booking Order detail with id => #{booking_detail["booking_order_detail_id"]} does not belong to this Booking Order => #{booking_transfer_params["booking_order_id"]}"
          end
          @booking_order_detail = BookingOrderDetail.find(booking_detail["booking_order_detail_id"])
          @bill_detail = BillDetail.find_by(booking_order_detail_id: @booking_order_detail.id, is_active: "1")
          # byebug
          # invalidate previous bill_detail
          @bill_detail.update!(
            is_active: "0",
            updated_by: @current_user.id,
          )
          # find the new room_type they are being transfered to
          @new_room_type = RoomType.find(booking_detail["room_type_id"])
          # update booking_detail with the transfer
          @booking_order_detail.update!(
            room_type_id: @new_room_type.id,
            total_applicants: booking_detail["total_applicants"],
            stay_start_date: booking_detail["stay_start_date"],
            stay_end_date: booking_detail["stay_end_date"],
            updated_by: @current_user.id,
          )
          # byebug
          # create a new bill_detail
          @new_bill_detail = BillDetail.create!(
            bill_no: @bill_info.bill_no,
            bill_info_id: @bill_info.id,
            room_type_id: @new_room_type.id,
            booking_order_detail_id: @booking_order_detail.id,
            bill_detail_description: "Room Transfer Bill: #{@new_room_type.room_type_description}",
            bill_item_id: @new_room_type.bill_item.id,
            bill_item_quantity: (@booking_order_detail.stay_end_date.to_date - @booking_order_detail.stay_start_date.to_date).to_i, # no of days
            bill_item_quantity2: @booking_order_detail.total_applicants,
            bill_item_rate: @new_room_type.bill_item.bill_item_rate,
            amount: BillInfo.calculate_fee(@new_room_type.bill_item.bill_item_rate.to_i, @booking_order_detail.total_applicants.to_i, (@booking_order_detail.stay_end_date.to_date - @booking_order_detail.stay_start_date.to_date).to_i),
          )

          # update bill_info to retain any paid amount
          # byebug
          @bill_info.update!(
            bill_total: BillInfo.calculate_fee_sum_details(@bill_info.id),
            reducing_balance: BillInfo.updated_reducing_balance(@bill_info.id),
            bill_status: BillInfo.update_bill_status(@bill_info.id),
            updated_by: @current_user.id,
          )
          # byebug
        end
      end
    rescue Exception => invalid
      @response = {
        status: 400,
        message: "Error in transfer",
        data: invalid,
      }
    rescue ActiveRecord::RecordInvalid => invalid
      @response = {
        status: 400,
        message: "Booking Transfer",
        data: invalid,
      }
    rescue ActiveRecord::RecordNotFound => invalid
      @response = {
        status: 400,
        message: "Record Not Found Error",
        data: invalid,
      }
    else
      @response = {
        status: 200,
        message: "Booking Transfer",
        data: @bill_info,
      }
    end

    render json: @response
  end

  # Expected Arrivals for today
  def expected_arrivals
    begin
      @booking_orders = BookingOrder.all.where(is_active: "1")
      @expected_booking_orders = []
      @booking_orders.each do |booking_order|
        # booking_order
        if @start_date = BookingOrder.stay_start_date(booking_order.id)
          # byebug
          if @start_date.to_date == Date.today
            @customer = Customer.find(booking_order.customer_id)
            # byebug
            # @customers =
            @booking_order_response = {
              booking_order_date: booking_order.booking_order_date,
              customer_id: booking_order.customer_id,
              customer_names: booking_order.customer.names,
              booking_order_status: Status.find(booking_order.booking_order_status).status_description,
              stay_start_date: BookingOrder.stay_start_date(booking_order.id),
              stay_end_date: BookingOrder.stay_end_date(booking_order.id),
              customers: booking_order.customers,

            }
            @expected_booking_orders << @booking_order_response
          end
        else
        end
      end
    rescue ActiveRecord::RecordInvalid => invalid
      @response = {
        status: 400,
        message: "Record Invalid",
        data: invalid,
      }
    rescue ActiveRecord::RecordNotFound => invalid
      @response = {
        status: 400,
        message: "Record not found",
        data: invalid,
      }
    else
      @response = {
        status: 200,
        message: "Expected Arrivals For Today",
        data: @expected_booking_orders,
      }
    end
    render json: @response
  end

  # Expected Departures for today
  def expected_departures
    begin
      @booking_orders = BookingOrder.all.where(is_active: "1")
      @expected_booking_orders = []
      @booking_orders.each do |booking_order|
        # booking_order
        if @start_date = BookingOrder.stay_end_date(booking_order.id)
          # byebug
          if @start_date.to_date == Date.today
            @customer = Customer.find(booking_order.customer_id)
            # byebug
            # @customers =
            @booking_order_response = {
              booking_order_date: booking_order.booking_order_date,
              customer_id: booking_order.customer_id,
              customer_names: booking_order.customer.names,
              booking_order_status: Status.find(booking_order.booking_order_status).status_description,
              stay_start_date: BookingOrder.stay_start_date(booking_order.id),
              stay_end_date: BookingOrder.stay_end_date(booking_order.id),
              customers: booking_order.customers,

            }
            @expected_booking_orders << @booking_order_response
          end
        else
        end
      end
    rescue ActiveRecord::RecordInvalid => invalid
      @response = {
        status: 400,
        message: "Record Invalid",
        data: invalid,
      }
    rescue ActiveRecord::RecordNotFound => invalid
      @response = {
        status: 400,
        message: "Record not found",
        data: invalid,
      }
    else
      @response = {
        status: 200,
        message: "Expected Departures For Today",
        data: @expected_booking_orders,
      }
    end
    render json: @response
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

  def walkin_bookinn_params
    params.permit(
      booking: [
        :booking_order_date,
        :booking_order_type_id,
        :customer_id,
        booking_details: [
          :stay_start_date,
          :stay_end_date,
          :room_type_id,
          :total_applicants,
        ],
      ],
    )
  end

  def mass_booking_params
    params.permit(
      :customer_id,
      :bill_info_description,
      bookings: [
        :room_type_id,
        :stay_start_date,
        :stay_end_date,
        :total_applicants,
        :description,
      ],
    )
  end

  def booking_transfer_params
    params.permit(
      :booking_order_id,
      booking_order_details: [
        :booking_order_detail_id,
        :room_type_id,
        :total_applicants,
        :stay_start_date,
        :stay_end_date,
      ],
    )
  end
end
