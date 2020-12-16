class PaymentModesController < ApplicationController
  before_action :set_payment_mode, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /payment_modes
  def index
    @payment_modes = PaymentMode.all
    response = {
      status: 200,
      message: "All payment modes",
      data: @payment_modes
    }
    render json: response
  end

  # GET /payment_modes/1
  def show
    response = {
      status: 200,
      message: "Specific Payment Mode",
      data: @payment_mode
    }
    render json: response
  end

  # POST /payment_modes
  def create
    @payment_mode = PaymentMode.new(payment_mode_params)

    if @payment_mode.save
      response = {
        status: 200,
        message: "Payment Mode created Successfully",
        data: @payment_mode
      }
      render json: response, status: :created, location: @payment_mode
    else
      response = {
        status: 400,
        message: "Failed to create payment mode",
        data: @payment_mode.errors
      }
      render json: response, status: :ok
    end
  end

  # PATCH/PUT /payment_modes/1
  def update
    if @payment_mode.update(payment_mode_params)
      response = {
        status: 200,
        message: "Payment Mode updated Successfully",
        data: @payment_mode
      }
      render json: response, status: :ok
    else
      response = {
        status: 400,
        message: "Failed to update payment mode",
        data: @payment_mode.errors
      }
      render json: @payment_mode.errors, status: :ok
    end
  end

  # DELETE /payment_modes/1
  def destroy
    @payment_mode.update(:is_active => "0")

    response  = {
      status: 200,
      message: "Payment Mode deleted Successfully",
      data: @payment_mode
    }
    
    render json: response, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_mode
      @payment_mode = PaymentMode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_mode_params
      params.require(:payment_mode).permit(:payment_mode_id, :payment_mode_description, :payment_mode_status)
    end
end
