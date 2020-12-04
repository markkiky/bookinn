class BillInfosController < ApplicationController
  before_action :set_bill_info, only: [:show, :update, :destroy]

  # GET /bill_infos
  def index
    @bill_infos = BillInfo.all

    render json: @bill_infos
  end

  # GET /bill_infos/1
  def show
    render json: @bill_info
  end

  # POST /bill_infos
  def create
    @bill_info = BillInfo.new(bill_info_params)
    @bill_info.bill_no = BillInfo.bill_no
    if @bill_info.save
      render json: @bill_info, status: :created, location: @bill_info
    else
      render json: @bill_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bill_infos/1
  def update
    if @bill_info.update(bill_info_params)
      render json: @bill_info
    else
      render json: @bill_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bill_infos/1
  def destroy
    @bill_info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_info
      @bill_info = BillInfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_info_params
      params.require(:bill_info).permit(:bill_no, :bill_date, :customer_id, :bill_total)
    end
end
