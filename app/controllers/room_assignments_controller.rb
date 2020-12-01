class RoomAssignmentsController < ApplicationController
  before_action :set_room_assignment, only: [:show, :update, :destroy]

  # GET /room_assignments
  def index
    @room_assignments = RoomAssignment.all

    render json: @room_assignments
  end

  # GET /room_assignments/1
  def show
    render json: @room_assignment
  end

  # POST /room_assignments
  def create
    @room_assignment = RoomAssignment.new(room_assignment_params)

    if @room_assignment.save
      render json: @room_assignment, status: :created, location: @room_assignment
    else
      render json: @room_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /room_assignments/1
  def update
    if @room_assignment.update(room_assignment_params)
      render json: @room_assignment
    else
      render json: @room_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /room_assignments/1
  def destroy
    @room_assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_assignment
      @room_assignment = RoomAssignment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_assignment_params
      # params.fetch(:room_assignment, {})
      params.require(:room_assignment).permit(:room_assignment_id, :customer_id, :customer_names, :room_id, :booking_order_id, :start_date, :end_date, :room_status, :is_active, :created_by, :updated_by)
    end
end
