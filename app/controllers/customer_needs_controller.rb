class CustomerNeedsController < ApplicationController
  before_action :set_customer_need, only: [:show, :update, :destroy]

  # GET /customer_needs
  def index
    @customer_needs = CustomerNeed.all

    render json: @customer_needs
  end

  # GET /customer_needs/1
  def show
    render json: @customer_need
  end

  # POST /customer_needs
  def create
    @customer_need = CustomerNeed.new(customer_need_params)

    if @customer_need.save
      render json: @customer_need, status: :created, location: @customer_need
    else
      render json: @customer_need.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer_needs/1
  def update
    if @customer_need.update(customer_need_params)
      render json: @customer_need
    else
      render json: @customer_need.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer_needs/1
  def destroy
    @customer_need.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_need
      @customer_need = CustomerNeed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_need_params
      params.require(:customer_need).permit(:customer_id, :need_type_id, :created_by, :updated_by)
    end
end
