class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authorize_request, except: :create

  # GET /users
  def index
    @users = User.all

    response = {
      status: 200,
      message: "All users",
      data: @users,
    }

    render json: response
  end

  # GET /users/1
  def show
    response = {
      status: 200,
      message: "Specific User",
      data: @user,
    }
    render json: response
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = params["password"]

    if @user.save
      render json: {
               status: 200,
               message: "Saved user successfully",
               data: @user,
             }, status: :created, location: @user
    else
      render json: {
               status: 400,
               error: "Failed to save User",
               data: @user.errors,
             },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    response = {
      status: 200,
      message: "Deleted User",
      data: @user
    }
    render json: response
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :username, :role_id, :identification_no)
  end
end
