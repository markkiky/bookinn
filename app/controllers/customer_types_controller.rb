class CustomerTypesController < ApplicationController
  before_action :set_customer_type, only: [:show, :update, :destroy]

  # GET /customer_types
  def index
    @customer_types = CustomerType.all

    render json: @customer_types
  end

  # GET /customer_types/1
  def show
    render json: @customer_type
  end

  # POST /customer_types
  def create
    @customer_type = CustomerType.new(customer_type_params)

    if @customer_type.save
      render json: @customer_type, status: :created, location: @customer_type
    else
      render json: @customer_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer_types/1
  def update
    if @customer_type.update(customer_type_params)
      render json: @customer_type
    else
      render json: @customer_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer_types/1
  def destroy
    @customer_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_type
      @customer_type = CustomerType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_type_params
      params.require(:customer_type).permit(:customer_type_id, :customer_type_description, :customer_type_status)
    end
end
