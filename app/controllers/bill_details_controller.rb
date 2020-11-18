class BillDetailsController < ApplicationController
  before_action :set_bill_detail, only: [:show, :update, :destroy]

  # GET /bill_details
  def index
    @bill_details = BillDetail.all

    render json: @bill_details
  end

  # GET /bill_details/1
  def show
    render json: @bill_detail
  end

  # POST /bill_details
  def create
    @bill_detail = BillDetail.new(bill_detail_params)

    if @bill_detail.save
      render json: @bill_detail, status: :created, location: @bill_detail
    else
      render json: @bill_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bill_details/1
  def update
    if @bill_detail.update(bill_detail_params)
      render json: @bill_detail
    else
      render json: @bill_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bill_details/1
  def destroy
    @bill_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_detail
      @bill_detail = BillDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_detail_params
      params.require(:bill_detail).permit(:bill_no, :bill_item_id, :bill_item_quantity, :bill_item_rate, :bill_item_amount, :bill_item_discount)
    end
end
