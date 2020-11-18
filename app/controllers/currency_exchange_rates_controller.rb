class CurrencyExchangeRatesController < ApplicationController
  before_action :set_currency_exchange_rate, only: [:show, :update, :destroy]

  # GET /currency_exchange_rates
  def index
    @currency_exchange_rates = CurrencyExchangeRate.all

    render json: @currency_exchange_rates
  end

  # GET /currency_exchange_rates/1
  def show
    render json: @currency_exchange_rate
  end

  # POST /currency_exchange_rates
  def create
    @currency_exchange_rate = CurrencyExchangeRate.new(currency_exchange_rate_params)

    if @currency_exchange_rate.save
      render json: @currency_exchange_rate, status: :created, location: @currency_exchange_rate
    else
      render json: @currency_exchange_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currency_exchange_rates/1
  def update
    if @currency_exchange_rate.update(currency_exchange_rate_params)
      render json: @currency_exchange_rate
    else
      render json: @currency_exchange_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currency_exchange_rates/1
  def destroy
    @currency_exchange_rate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_exchange_rate
      @currency_exchange_rate = CurrencyExchangeRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def currency_exchange_rate_params
      params.require(:currency_exchange_rate).permit(:currency_exchange_rate_id, :base_currency_id, :secondary_currency_id, :exchange_rate, :start_date, :end_date, :exchange_rate_status)
    end
end
