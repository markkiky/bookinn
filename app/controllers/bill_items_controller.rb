class BillItemsController < ApplicationController
  before_action :set_bill_item, only: [:show, :update, :destroy]

  # GET /bill_items
  def index
    @bill_items = BillItem.all
    @bill_items_response = []
    @bill_items.each do |bill_item|
      @bill_item = {
        id: bill_item.id,
        bill_item_id: bill_item.bill_item_id,
        unit_of_measure_id: bill_item.unit_of_measure_id,
        unit_of_measure: bill_item.unit_of_measure.unit_description,
        bill_item_description: bill_item.bill_item_description,
        bill_item_rate: bill_item.bill_item_rate,
        bill_item_quantity: bill_item.bill_item_quantity,
        bill_item_status: bill_item.bill_item_status,
        status: Status.find(bill_item.bill_item_status).status_description,
      }
      @bill_items_response << @bill_item
    end
    @response = {
      status: 200,
      message: "success",
      data: @bill_items_response,
    }

    render json: @response
  end

  # GET /bill_items/1
  def show
    @response = {
      status: 200,
      message: "success",
      data: @bill_item,
    }

    render json: @response
  end

  # POST /bill_items
  def create
    @bill_item = BillItem.new(bill_item_params)

    if @bill_item.save
      @response = {
        status: 200,
        message: "success",
        data: @bill_item,
      }

      render json: @response
      # render json: @bill_item, status: :created, location: @bill_item
    else
      @response = {
        status: 400,
        message: "success",
        data: @bill_item.errors,
      }

      render json: @response
      # render json: @bill_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bill_items/1
  def update
    if @bill_item.update(bill_item_params)
      @response = {
        status: 200,
        message: "success",
        data: @bill_item,
      }

      render json: @response
      # render json: @bill_item
    else
      @response = {
        status: 400,
        message: "success",
        data: @bill_item.errors,
      }

      render json: @response
      # render json: @bill_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bill_items/1
  def destroy
    @bill_item.update(is_active: "0")
    @response = {
      status: 200,
      message: "success",
      data: @bill_item,
    }

    render json: @response
    # @bill_item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bill_item
    @bill_item = BillItem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bill_item_params
    params.require(:bill_item).permit(:bill_item_id, :bill_item_description, :bill_item_rate, :bill_item_unit_of_measure_id, :bill_item_unit_of_measure_description, :bill_item_status, :unit_of_measure_id, :bill_item_quantity,  :created_by, :updated_by)
  end
end
