class BillInfosController < ApplicationController
  before_action :set_bill_info, only: [:show, :update, :destroy]

  # GET /bill_infos
  def index
    @bill_infos = BillInfo.all
    @bill_infos_response = []

    @bill_infos.each do |bill_info|
      @bill_info_response = {
        bill_info_id: bill_info.id,
        bill_no: bill_info.bill_no,
        bill_date: bill_info.bill_date,
        customer_id: bill_info.customer_id,
        customer: Customer.find_by(:id => bill_info.customer_id) ? Customer.find_by(:id => bill_info.customer_id).names : "Customer not defined",
        bill_total: bill_info.bill_total,
        reducing_balance: bill_info.reducing_balance,
        bill_status_id: bill_info.bill_status,
        bill_status: Status.find_by(:id => bill_info.bill_status) ? Status.find_by(:id => bill_info.bill_status).status_description : "Status not defined",
        bill_details: bill_info.bill_details,
      }

      @bill_infos_response << @bill_info_response
    end

    response = {
      status: 200,
      message: "ALL Bill Infos",
      data: @bill_infos_response,
    }

    render json: response
  end

  # GET /bill_infos/1
  def show
    # custom response
    @bill_info_response = {
      bill_no: @bill_info.bill_no,
      bill_date: @bill_info.bill_date,
      customer_id: @bill_info.customer_id,
      customer: Customer.find_by(:id => @bill_info.customer_id) ? Customer.find_by(:id => @bill_info.customer_id).names : "Customer not defined",
      bill_total: @bill_info.bill_total,
      reducing_balance: @bill_info.reducing_balance,
      bill_details: @bill_info.bill_details,
    }

    response = {
      status: 200,
      message: "Bill Info",
      data: @bill_info_response,
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
        data: @bill_info,
      }
      render json: response, status: :created, location: @bill_info
    else
      response = {
        status: 200,
        message: "Failed Bill Info",
        data: @bill_info.errors,
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bill_infos/1
  def update
    if @bill_info.update(bill_info_params)
      response = {
        status: 200,
        message: "Updated",
        data: @bill_info,
      }
      render json: response
    else
      response = {
        status: 200,
        message: "Updated",
        data: @bill_infos.errors,
      }
      render json: @bill_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bill_infos/1
  def destroy
    @bill_info.updated(:is_active => 0)
    response = {
      status: 200,
      message: "Deleted",
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
