class ChannelTransactionsController < ApplicationController
  before_action :set_channel_transaction, only: [:show, :update, :destroy]

  # GET /channel_transactions
  def index
    @channel_transactions = ChannelTransaction.all
    response = {
      status: 200,
      message: "All Channel Transactions",
      data: @channel_transactions
    }
    
    render json: response
  end

  # GET /channel_transactions/1
  def show
    response = {
      status: 200,
      message: "Specific Channel Transaction",
      data: @channel_transactions
    }
    render json: response
  end

  # POST /channel_transactions
  def create
    @channel_transaction = ChannelTransaction.new(channel_transaction_params)

    if @channel_transaction.save
      response = {
        status: 200,
        message: "Channel Transaction created successfully",
        data: @channel_transaction
      }
      render json: response, status: :ok, location: @channel_transaction
    else
      response = {
        status: 200,
        message: "Failed to create Transaction",
        data: @channel_transaction.errors
      }
      render json: response, status: :ok
    end
  end

  # PATCH/PUT /channel_transactions/1
  def update
    if @channel_transaction.update(channel_transaction_params)
      response = {
        status: 200,
        message: "Channel Transaction updated successfully",
        data: @channel_transaction
      }
      render json: response, status: :ok
    else
      response = {
        status: 400,
        message: "Failed to update channel transaction",
        data: @channel_transaction.errors
      }
      render json: @channel_transaction.errors, status: :ok
    end
  end

  # DELETE /channel_transactions/1
  def destroy
    @channel_transaction.update(:is_active => '0')
    response = {
      status: 200,
      message: "Channel Transaction deleted successfully",
      data: @channel_transaction
    }
    
    render json: response
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
