class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :update, :destroy]

  # GET /hotels
  def index
    @hotels = Hotel.all

    response = {
      status: 200,
      message: "All hotels",
      data: @hotels
    }
    render json: response
  end

  # GET /hotels/1
  def show
    response = {
      status: 200,
      message: "Specific hotel",
      data: @hotel
    }
    render json: response
  end

  # POST /hotels
  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.id = Hotel.hotel_id
    @hotel.parent_hotel_id = hotel_params['parent_hotel_id'] ? hotel_params["parent_hotel_id"] : Hotel.hotel_id

    if @hotel.save
      response = {
        status: 200,
        message: "Hotel created successfully",
        data: @hotel
      }
      render json: response, status: :ok, location: @hotel
    else
      response = {
        status: 400,
        message: "Failed to created Hotel",
        data: @hotel.errors
      }
      render json: response
    end
  end

  # PATCH/PUT /hotels/1
  def update
    if @hotel.update(hotel_params)
      response = {
        status: 200,
        message: "Hotel updated Successfully",
        data: @hotel
      }
      render json: response
    else
      response = {
        status: 200,
        message: "Failed to update hotel",
        data: @hotel.errors
      }
      render json: response
    end
  end

  # DELETE /hotels/1
  def destroy
    @hotel.update(:is_active => "0")
    response = {
      status: 200,
      message: "Hotel deleted successfully",
      data: @hotel
    }
    # @hotel.destroy
    render json: response
  end


  # GET /hotel_rooms/1
  def hotel_rooms
    @hotel = Hotel.find(params[:id])
    @rooms = Room.all.where(:hotel_id => @hotel.id)
    response = {
      status: 200,
      message: "Rooms in Hotel #{@hotel.hotel_name}",
      data: @rooms
    }
    render json: response
  end

  # GET /hotel_sisters/1
  def sister_hotels
    @hotel = Hotel.find(params[:id])
    @sister_hotels = Hotel.all.where(:parent_hotel_id => @hotel.parent_hotel_id)

    response = {
      status: 200,
      message: "All sister hotels",
      data: @sister_hotels
    }

    render json: @sister_hotels
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_params
      params.require(:hotel).permit(:hotel_id, :hotel_name, :hotel_email, :hotel_contact_person, :hotel_mobile, :hotel_type_id, :parent_hotel_id, :hotel_status, :created_by, :updated_by)
    end
end
