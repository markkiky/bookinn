class BillInfosController < ApplicationController
  before_action :set_bill_info, only: [:show, :update, :destroy]

  # GET /bill_infos
  def index
    @bill_infos = BillInfo.all
    @bill_infos_response = []

    @bill_infos.each do |bill_info|
      @bill_info_response = {
        bill_info_id: bill_info.id,
        bill_no: bill_info.bill_no,
        bill_date: bill_info.bill_date,
        customer_id: bill_info.customer_id,
        customer: Customer.find_by(:id => bill_info.customer_id) ? Customer.find_by(:id => bill_info.customer_id).names : "Customer not defined",
        bill_total: bill_info.bill_total,
        reducing_balance: bill_info.reducing_balance,
        bill_status_id: bill_info.bill_status,
        bill_status: Status.find_by(:id => bill_info.bill_status) ? Status.find_by(:id => bill_info.bill_status).status_description : "Status not defined",
        bill_details: bill_info.bill_details,
      }

      @bill_infos_response << @bill_info_response
    end

    response = {
      status: 200,
      message: "ALL Bill Infos",
      data: @bill_infos_response,
    }

    render json: response
  end

  # GET /bill_infos/1
  def show
    # custom response
    @bill_info_response = {
      bill_no: @bill_info.bill_no,
      bill_date: @bill_info.bill_date,
      customer_id: @bill_info.customer_id,
      customer: Customer.find_by(:id => @bill_info.customer_id) ? Customer.find_by(:id => @bill_info.customer_id).names : "Customer not defined",
      bill_total: @bill_info.bill_total,
      reducing_balance: @bill_info.reducing_balance,
      bill_details: @bill_info.bill_details,
    }

    response = {
      status: 200,
      message: "Bill Info",
      data: @bill_info_response,
    }
    render json: response
  end

  # POST /bill_infos
  def create
    @bill_info = BillInfo.new(bill_info_params)
    @bill_info.bill_no = BillInfo.bill_no
    if @bill_info.save
      response = {
        status: 200,
        message: "Created Bill Info",
        data: @bill_info,
      }
      render json: response, status: :created, location: @bill_info
    else
      response = {
        status: 200,
        message: "Failed Bill Info",
        data: @bill_info.errors,
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bill_infos/1
  def update
    if @bill_info.update(bill_info_params)
      response = {
        status: 200,
        message: "Updated",
        data: @bill_info,
      }
      render json: response
    else
      response = {
        status: 200,
        message: "Updated",
        data: @bill_infos.errors,
      }
      render json: @bill_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bill_infos/1
  def destroy
    @bill_info.updated(:is_active => 0)
    response = {
      status: 200,
      message: "Deleted",
    }
    # @bill_info.destroy
  end

  # POST /search_bill
  def search_bill
    @bill_info = BillInfo.find_by(:bill_no => search_bill_params["bill_no"])
    if @bill_info.nil?
      response = {
        status: 400,
        message: "Bill not Found",
      # data: @bill_response,
      }
    else
      @payment_transactions = PaymentTransaction.where(:bill_no => @bill_info.bill_no)
      @total_paid = 0
      @payment_transactions_response = []
      @payment_transactions.each do |payment|
        @total_paid = @total_paid + payment.payment_transaction_amount.to_i
        @payment_transaction_response = {
          id: payment.id,
          payment_transaction_id: payment.payment_transaction_id,
          bill_no: payment.bill_no,
          payment_transaction_date: payment.payment_transaction_date,
          payment_transaction_amount: payment.payment_transaction_amount,
          payment_mode: PaymentMode.find_by(:id => payment.payment_mode_id).payment_mode_description,
          payment_transaction_ref: payment.payment_transaction_ref,
          phone: payment.payment_transaction_phone
        }

        @payment_transactions_response << @payment_transaction_response
      end
      @bill_info_response = {
        id: @bill_info.id,
        bill_no: @bill_info.bill_no,
        bill_date: @bill_info.bill_date,
        customer: Customer.find_by(:id => @bill_info.customer_id) ? Customer.find_by(:id => @bill_info.customer_id).names : "Customer not found",
        phone: Customer.find_by(:id => @bill_info.customer_id) ? Customer.find_by(:id => @bill_info.customer_id).phone : "Customer phone number not found",
        email: Customer.find_by(:id => @bill_info.customer_id) ? Customer.find_by(:id => @bill_info.customer_id).email : "Customer email not found",
        customer_id: @bill_info.customer_id,
        booking_no: BookingOrder.find_by(:id => @bill_info.booking_order_id) ? BookingOrder.find_by(:id => @bill_info.booking_order_id).booking_no : "Booking Order not found",
        bill_total: @bill_info.bill_total,
        total_paid: @total_paid,
        reducing_balance: @bill_info.reducing_balance,
        bill_status: Status.find_by(:id => @bill_info.bill_status) ? Status.find_by(:id => @bill_info.bill_status).status_description : "Status not found",
        bill_status_id: @bill_info.bill_status,
        stay_start_date: BookingOrder.stay_start_date(BookingOrder.find_by(:id => @bill_info.booking_order_id).id),
        stay_end_date: BookingOrder.stay_end_date(BookingOrder.find_by(id: @bill_info.booking_order_id).id)
      }
      @booking_order = BookingOrder.find_by(:id => @bill_info.booking_order_id)
      @booking_order_detail = BookingOrderDetail.where(:booking_order_id => @booking_order.id)

      @bill_response = {
        bill: @bill_info_response,
        bill_details: BillInfo.bill_details(@bill_info.id),
        payments: @payment_transactions_response,
        booking_order: @booking_order,
        booking_order_detail: @booking_order_detail,
      }
      response = {
        status: 200,
        message: "Bill Found",
        data: @bill_response,
      }
    end

    render json: response
  end

  private

  def search_bill_params
    params.permit(:bill_no)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_bill_info
    @bill_info = BillInfo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bill_info_params
    params.require(:bill_info).permit(:bill_no, :bill_date, :customer_id, :bill_total)
  end
end
