class NeedTypesController < ApplicationController
  before_action :set_need_type, only: [:show, :update, :destroy]

  # GET /need_types
  def index
    @need_types = NeedType.all

    render json: @need_types
  end

  # GET /need_types/1
  def show
    render json: @need_type
  end

  # POST /need_types
  def create
    @need_type = NeedType.new(need_type_params)

    if @need_type.save
      render json: @need_type, status: :created, location: @need_type
    else
      render json: @need_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /need_types/1
  def update
    if @need_type.update(need_type_params)
      render json: @need_type
    else
      render json: @need_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /need_types/1
  def destroy
    @need_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_need_type
      @need_type = NeedType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def need_type_params
      params.fetch(:need_type, {})
    end
end
