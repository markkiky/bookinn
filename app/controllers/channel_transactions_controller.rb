class ChannelTransactionsController < ApplicationController
  before_action :set_channel_transaction, only: [:show, :update, :destroy]

  # GET /channel_transactions
  def index
    @channel_transactions = ChannelTransaction.all

    render json: @channel_transactions
  end

  # GET /channel_transactions/1
  def show
    render json: @channel_transaction
  end

  # POST /channel_transactions
  def create
    @channel_transaction = ChannelTransaction.new(channel_transaction_params)

    if @channel_transaction.save
      render json: @channel_transaction, status: :created, location: @channel_transaction
    else
      render json: @channel_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /channel_transactions/1
  def update
    if @channel_transaction.update(channel_transaction_params)
      render json: @channel_transaction
    else
      render json: @channel_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /channel_transactions/1
  def destroy
    @channel_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel_transaction
      @channel_transaction = ChannelTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_transaction_params
      params.require(:channel_transaction).permit(:channel_transaction_id, :channel_transaction_date, :channel_transaction_type, :channel_transaction_amount)
    end
end
