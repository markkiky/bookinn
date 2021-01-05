class LaundriesController < ApplicationController
  before_action :set_laundry, only: [:show, :update, :destroy]

  # GET /laundries
  def index
    @laundries = Laundry.all
    response = {
      status: 200,
      message: "All Laundries",
      data: @laundries
    }
    render json: response
  end

  # GET /laundries/1
  def show

    response = {
      status: 200,
      message: "A specific Laundry",
      data: @laundry
    }
    render json: response
  end

  # POST /laundries
  def create
    @laundry = Laundry.new(laundry_params)

    if @laundry.save
      response = {
        status: 200,
        message: "Laundry created successfully",
        data: @laundry
      }
      render json: response
    else
      response = {
        status: 400,
        message: "Failed to created Laundry",
        data: @laundry.errors
      }
      render json: response
    end
  end

  # PATCH/PUT /laundries/1
  def update
    if @laundry.update(laundry_params)
      response = {
        status: 200,
        message: "Laundry updated successfully",
        data: @laundry
      }
      render json: response
      
    else
      response = {
        status: 400,
        message: "Failed to update Laundry",
        data: @laundry.errors
      }
      render json: response
    end
  end

  # DELETE /laundries/1
  def destroy
    @laundry.update(:is_active => "0")
    
    response = {
      status: 200,
      message: "Laundry deleted successfully",
      data: @laundry
    }
    render json: response
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laundry
      @laundry = Laundry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def laundry_params
      params.require(:laundry).permit(:laundry_package_id, :customer_id, :booking_order_id, :laundry_status)
    end
end
