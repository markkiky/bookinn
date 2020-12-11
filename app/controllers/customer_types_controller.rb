class CustomerTypesController < ApplicationController
  before_action :set_customer_type, only: [:show, :update, :destroy]

  # GET /customer_types
  def index
    @customer_types = CustomerType.all
    response = {
      status: 200,
      message: "All Customer Types",
      data: @customer_types
    }
    render json: response
  end

  # GET /customer_types/1
  def show
    render json: @customer_type
  end

  # POST /customer_types
  def create
    @customer_type = CustomerType.new(customer_type_params)
    @customer_type.customer_id = CustomerType.customer_type_id
    
    if @customer_type.save
      response = {
        status: 200,
        message: "Customer Type Created Successfully",
        data: @customer_type
      }
      render json: response, status: :created, location: @customer_type
    else
      response = {
        status: 200,
        message: "Failed to create Customer Type",
        data: @customer_type.errors
      }
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
      params.permit(:customer_type_id, :customer_type_description, :customer_type_status)
    end
end
