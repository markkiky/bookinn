class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]
  before_action :authorize_request
  
  # GET /roles
  def index
    @roles = Role.all.where(:is_active => 1)
    response = {
      status: 200,
      message: "All Roles",
      data: @roles
    }
    render json: response
  end

  # GET /roles/1
  def show
    response = {
      status: 200,
      message: "Specific Role",
      data: @role
    }
    render json: response
  end

  # POST /roles
  def create
    @role = Role.new(role_params)

    if @role.save
      response = {
        status: 200,
        message: "Role created successfully",
        data: @role
      }
      render json: response, status: :created, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      response = {
        status: 200,
        message: "Role updated successfully",
        data: @role
      }
      render json: response
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  def destroy
    @role.update(:is_active => 0)
    response = {
      status: 200,
      message: "Role deleted Successfully",
      data: @role
    }
    # @role.destroy
    render json: response

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:role).permit(:role_id, :role_description, :role_status)
    end
end
