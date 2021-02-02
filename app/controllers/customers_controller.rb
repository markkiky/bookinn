class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /customers
  def index
    @customers = Customer.all.where(:is_active => 1)
    @customers_response = []
    @customers.each do |customer|
      @customer = {
        id: customer.id,
        customer_id: customer.id,
        customer_no: customer.customer_no,
        customer_type_description: CustomerType.find_by(:id => customer.customer_type_id) ? CustomerType.find_by(:id => customer.customer_type_id).customer_type_description : "Customer Type not defined",
        country: Country.find_by(:id => customer.country_id) ? Country.find_by(:id => customer.country_id).name : "Country not defined",
        names: customer.names,
        gender: customer.gender,
        email: customer.email,
        phone: customer.phone,
        id_no: customer.id_no,
        bookings: Customer.customer_bookings(customer.id),
        customer_type_id: customer.customer_type_id,
        channel_id: customer.channel_id,
        channel_description: Channel.find_by(id: customer.channel_id) ?  Channel.find_by(id: customer.channel_id).channel_description : "Not a Channel"
      }
      @customers_response << @customer
    end
    response = {
      status: 200,
      message: "All customers and their bookings",
      data: @customers_response,
    }

    render json: response
  end

  # GET /customers/1
  def show
    @customer_response = {
      customer_id: @customer.id,
      customer_no: @customer.customer_no,
      customer_type_description: Country.find_by(:id => @customer.country_id) ? Country.find_by(:id => @customer.country_id).name : "Country not defined",
      country: Country.find_by(:id => @customer.country_id) ? Country.find_by(:id => @customer.country_id).name : "Country not defined",
      names: @customer.names,
      gender: @customer.gender,
      email: @customer.email,
      phone: @customer.phone,
      id_no: @customer.id_no,
      bookings: Customer.customer_bookings(@customer.id),
    }
    response = {
      status: 200,
      message: "Specific Customer",
      data: @customer_response,
    }
    render json: response
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    @customer.customer_no = Customer.customer_no
    @customer.customer_id = Customer.customer_id
    @customer.created_by = current_user
    
    if @customer.save
      response = {
        status: 200,
        message: "Customer created successfully",
        data: @customer,
      }
      render json: response, status: :created, location: @customer
    else
      response = {
        status: 200,
        message: "Failed to create Customer",
        data: @customer.errors,
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    @customer.updated_by = current_user
    if @customer.update(customer_params)
      response = {
        status: 200,
        message: "Customer updated successfully",
        data: @customer,
      }
      render json: response
    else
      response = {
        status: 200,
        message: "Failed to update customer",
        data: @customer.errors,
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.update(:is_active => "0")
    response = {
      status: 200,
      message: "Customer deleted successfully",
      data: @customer
    }
    render json: response
  end

  def channel_customers
    @customers = Customer.all.where(:channel_id => "1")
    # byebug
    response = {
      status: 200,
      message: "Returning customers who are channels",
      data: @customers
    }
    render json: response, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def customer_params
    params.permit(:customer_no, :customer_id, :customer_type_id, :country_id, :id_no, :gender, :names, :email, :phone, :customer_address, :postal_code, :address, :customer_status, :customer_status_date, :last_visit, :last_invoice, :last_receipt, :created_by, :updated_by, :channel_id)
  end
end
