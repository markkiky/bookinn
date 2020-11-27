class BillItemsController < ApplicationController
  before_action :set_bill_item, only: [:show, :update, :destroy]

  # GET /bill_items
  def index
    @bill_items = BillItem.all

    render json: @bill_items
  end

  # GET /bill_items/1
  def show
    render json: @bill_item
  end

  # POST /bill_items
  def create
    @bill_item = BillItem.new(bill_item_params)

    if @bill_item.save
      render json: @bill_item, status: :created, location: @bill_item
    else
      render json: @bill_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bill_items/1
  def update
    if @bill_item.update(bill_item_params)
      render json: @bill_item
    else
      render json: @bill_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bill_items/1
  def destroy
    @bill_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_item
      @bill_item = BillItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_item_params
      params.require(:bill_item).permit(:bill_item_id, :bill_item_description, :bill_item_rate, :bill_item_unit_of_measure_id, :bill_item_unit_of_measure_description, :bill_item_status, :created_by, :updated_by)
    end
end
