class PaymentModesController < ApplicationController
  before_action :set_payment_mode, only: [:show, :update, :destroy]

  # GET /payment_modes
  def index
    @payment_modes = PaymentMode.all

    render json: @payment_modes
  end

  # GET /payment_modes/1
  def show
    render json: @payment_mode
  end

  # POST /payment_modes
  def create
    @payment_mode = PaymentMode.new(payment_mode_params)

    if @payment_mode.save
      render json: @payment_mode, status: :created, location: @payment_mode
    else
      render json: @payment_mode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payment_modes/1
  def update
    if @payment_mode.update(payment_mode_params)
      render json: @payment_mode
    else
      render json: @payment_mode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payment_modes/1
  def destroy
    @payment_mode.destroy
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
