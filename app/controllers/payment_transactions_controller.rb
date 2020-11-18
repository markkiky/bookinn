class PaymentTransactionsController < ApplicationController
  before_action :set_payment_transaction, only: [:show, :update, :destroy]

  # GET /payment_transactions
  def index
    @payment_transactions = PaymentTransaction.all

    render json: @payment_transactions
  end

  # GET /payment_transactions/1
  def show
    render json: @payment_transaction
  end

  # POST /payment_transactions
  def create
    @payment_transaction = PaymentTransaction.new(payment_transaction_params)

    if @payment_transaction.save
      render json: @payment_transaction, status: :created, location: @payment_transaction
    else
      render json: @payment_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payment_transactions/1
  def update
    if @payment_transaction.update(payment_transaction_params)
      render json: @payment_transaction
    else
      render json: @payment_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payment_transactions/1
  def destroy
    @payment_transaction.destroy
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
