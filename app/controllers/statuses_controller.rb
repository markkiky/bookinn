class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :destroy]

  # GET /statuses
  def index
    @statuses = Status.all.where(:is_active => 1)
    response = {
      status: 200,
      message: "All statuses",
      data: @statuses
    }
    render json: response
  end

  # GET /statuses/1
  def show
    response = {
      status: 200,
      message: "Specific status",
      data: @status
    }
    render json: response
  end

  # POST /statuses
  def create
    @status = Status.new(status_params)

    if @status.save
      response = {
        status: 200,
        message: "Status created successfully",
        data: @status
      }
      render json: response, status: :created, location: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /statuses/1
  def update
    if @status.update(status_params)
      response = {
        status: 200,
        message: "All statuses",
        data: @status
      }
      render json: response
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /statuses/1
  def destroy
    @status.update(:is_active => 0)
    response = {
      status: 200,
      message: "All statuses",
      data: @status
    }
    # @status.destroy
    render json: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:status_id, :status_cluster_id, :status_description)
    end
end
