class PaymentTransactionTypesController < ApplicationController
  before_action :set_payment_transaction_type, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /payment_transaction_types
  def index
    @payment_transaction_types = PaymentTransactionType.all
    response = {
      status: 200,
      message: "All payment transaction types",
      data: @payment_transaction_types
    }
    

    render json: response
  end

  # GET /payment_transaction_types/1
  def show
    response = {
      status: 200,
      message: "Specific Payment Transaction Type",
      data: @payment_transaction_type

    }
    render json: response
  end

  # POST /payment_transaction_types
  def create
    @payment_transaction_type = PaymentTransactionType.new(payment_transaction_type_params)
    @payment_transaction_type.payment_transaction_type_id = PaymentTransactionType.payment_transaction_type_id
    @payment_transaction_type.created_by = @current_user.id

    if @payment_transaction_type.save
      response = {
        status: 200,
        message: "Payment Transaction Type created successfully",
        data: @payment_transaction_type
      }
      render json: response, status: :created, location: @payment_transaction_type
    else
      response = {
        status: 400,
        message: "Failed to created Payment Transaction Type",
        data: @payment_transaction_type.errors
      }
      render json: response, status: :ok
    end
  end

  # PATCH/PUT /payment_transaction_types/1
  def update
    @payment_transaction_type.updated_by = @current_user.id
    if @payment_transaction_type.update(payment_transaction_type_params)
      response = {
        status: 200,
        message: "Payment Transaction Type updated successfully",
        data: @payment_transaction_type
      }
      render json: response
    else
      response = {
        status: 400,
        message: "Failed to update Payment Transaction Type",
        data: @payment_transaction_type.errors
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # DELETE /payment_transaction_types/1
  def destroy
    @payment_transaction_type.update(:is_active => "0")
    response = {
      status: 200,
      message: "Payment Transaction Type deleted successfully",
      data: @payment_transaction_type
    }
    render json: response
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
