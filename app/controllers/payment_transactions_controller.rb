class PaymentTransactionsController < ApplicationController
  before_action :set_payment_transaction, only: [:show, :update, :destroy]
  before_action :authorize_request
  
  # GET /payment_transactions
  def index
    @payment_transactions = PaymentTransaction.all
    response = {
      status: 200,
      message: "All payment transactions",
      data: @payment_transactions,
    }

    render json: response
  end

  # GET /payment_transactions/1
  def show
    response = {
      status: 200,
      message: "Specific transaction",
      data: @payment_transaction,
    }
    render json: response
  end

  # POST /payment_transactions
  def create
    @payment_transaction = PaymentTransaction.new(payment_transaction_params)

    if @payment_transaction.save
      response = {
        status: 200,
        message: "Payment Transaction created Successfully",
        data: @payment_transaction,
      }
      render json: response, status: :created, location: @payment_transaction
    else
      response = {
        status: 400,
        message: "Failed to create payment transaction",
        data: @payment_transaction.errors,
      }
      render json: response, status: :ok
    end
  end

  # PATCH/PUT /payment_transactions/1
  def update
    if @payment_transaction.update(payment_transaction_params)
      response = {
        status: 200,
        message: "Payment Transaction updated successfully",
        data: @payment_transaction,
      }
      render json: response
    else
      response = {
        status: 200,
        message: "Failed to update Payment Transaction",
        data: @payment_transaction.errors,
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # DELETE /payment_transactions/1
  def destroy
    @payment_transaction.update(:is_active => "0")
    response = {
      status: 200,
      message: "Payment Transaction deleted Successfully",
      data: @payment_transaction,
    }

    render json: response
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment_transaction
    @payment_transaction = PaymentTransaction.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def payment_transaction_params
    params.require(:payment_transaction).permit(:payment_transaction_id, :booking_order_no, :bill_no, :payment_transaction_date, :payment_transaction_type, :payment_transaction_amount, :payment_mode_id)
  end
end
