class FrontOfficeController < ApplicationController

  # POST /room/status
  def room_status
    # puts params[:status]
    puts room_status_params
    if room_status_params["status"].blank?
      response = {
        status: 400,
        error: "A status is required to search for rooms",
        data: [],
      }
    else
      if Status.where(:id => room_status_params["status"]).exists?
        if room_status_params["start_date"] && room_status_params["end_date"]
          begin
            Date.parse(room_status_params["start_date"]) && Date.parse(room_status_params["end_date"])
            p = ActiveRecord::Base.connection.execute("SELECT r.*, rs.start_date, rs.end_date FROM rooms r JOIN room_assignments rs ON rs.room_id = r.id;")
            byebug
            response = {
                status: 200,
                error: "Valid date",
                data: []
            }
          rescue ArgumentError
            # handle invalid date
            # byebug
            puts "Invalid date"
            response = {
                status: 400,
                error: "Invalid date",
                data: []
            }
            # render json: response
          end
        else
          @rooms = Room.where(:status => room_status_params["status"])
          response = {
            status: 200,
            message: "#{Status.find_by(:id => room_status_params["status"]).status_description} rooms",
            data: @rooms,
          }
        end
      else
        response = {
          status: 400,
          error: "Status with id #{room_status_params["status"]} does not exist",
          data: [],
        }
      end
    end

    render json: response
  end

  private

  def room_status_params
    params.permit(:status, :room_type_id, :start_date, :end_date)
  end
end
