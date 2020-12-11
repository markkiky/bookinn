class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all
    response = {
      status: 200,
      message: "All Customer Complains",
      data: @tickets
    }
   

    render json: response
  end

  # GET /tickets/1
  def show
    response = {
      status: 200,
      message: "All Customer Complains",
      data: @ticket
    }
    render json: response
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
     
    

    if @ticket.save
      response = {
        status: 200,
        message: "Ticket Created Successfully",
        data: @ticket
      }
      render json: response, status: :created, location: @ticket
    else
      response = {
        status: 200,
        message: "Failed to create ticket",
        data: @ticket.errors
      }
      render json: response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_params
      params.require(:ticket).permit(:ticket_id, :ticket_no, :customer_id, :ticket_description, :ticket_date, :ticket_status, :created_by, :updated_by)
    end
end
