class PaymentTransactionTypesController < ApplicationController
  before_action :set_payment_transaction_type, only: [:show, :update, :destroy]

  # GET /payment_transaction_types
  def index
    @payment_transaction_types = PaymentTransactionType.all

    render json: @payment_transaction_types
  end

  # GET /payment_transaction_types/1
  def show
    render json: @payment_transaction_type
  end

  # POST /payment_transaction_types
  def create
    @payment_transaction_type = PaymentTransactionType.new(payment_transaction_type_params)

    if @payment_transaction_type.save
      render json: @payment_transaction_type, status: :created, location: @payment_transaction_type
    else
      render json: @payment_transaction_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payment_transaction_types/1
  def update
    if @payment_transaction_type.update(payment_transaction_type_params)
      render json: @payment_transaction_type
    else
      render json: @payment_transaction_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payment_transaction_types/1
  def destroy
    @payment_transaction_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_transaction_type
      @payment_transaction_type = PaymentTransactionType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_transaction_type_params
      params.require(:payment_transaction_type).permit(:payment_transaction_type_id, :payment_transaction_type_description, :payment_transaction_type_status)
    end
end
