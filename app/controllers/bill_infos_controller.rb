class BillInfosController < ApplicationController
  before_action :set_bill_info, only: [:show, :update, :destroy]

  # GET /bill_infos
  def index
    @bill_infos = BillInfo.all
    response = {
      status: 200,
      message: "ALL Bill Infos",
      data: @bill_infos
    }
    

    render json: response
  end

  # GET /bill_infos/1
  def show
    response = {
      status: 200,
      message: "Bill Info",
      data: @bill_info
    }
    render json: response
  end

  # POST /bill_infos
  def create
    @bill_info = BillInfo.new(bill_info_params)
    @bill_info.bill_no = BillInfo.bill_no
    if @bill_info.save
      response = {
        status: 200,
        message: "Created Bill Info",
        data: @bill_info
      }
      render json: response, status: :created, location: @bill_info
    else
      response = {
        status: 200,
        message: "Failed Bill Info",
        data: @bill_info.errors
      }
      render json:response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bill_infos/1
  def update
    if @bill_info.update(bill_info_params)
      response = {
        status: 200,
        message: "Updated",
        data: @bill_info
      }
      render json: response
    else
      response = {
        status: 200,
        message: "Updated",
        data: @bill_infos.errors
      }
      render json: @bill_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bill_infos/1
  def destroy
    @bill_info.updated(:is_active => 0)
    response = {
      status: 200,
      message: "Deleted"
    }
    # @bill_info.destroy
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
