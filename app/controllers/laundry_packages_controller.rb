class LaundryPackagesController < ApplicationController
  before_action :set_laundry_package, only: [:show, :update, :destroy]

  # GET /laundry_packages
  def index
    @laundry_packages = LaundryPackage.all

    render json: @laundry_packages
  end

  # GET /laundry_packages/1
  def show
    render json: @laundry_package
  end

  # POST /laundry_packages
  def create
    @laundry_package = LaundryPackage.new(laundry_package_params)

    if @laundry_package.save
      render json: @laundry_package, status: :created, location: @laundry_package
    else
      render json: @laundry_package.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /laundry_packages/1
  def update
    if @laundry_package.update(laundry_package_params)
      render json: @laundry_package
    else
      render json: @laundry_package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /laundry_packages/1
  def destroy
    @laundry_package.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laundry_package
      @laundry_package = LaundryPackage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def laundry_package_params
      params.require(:laundry_package).permit(:laundry_description, :amount)
    end
end
