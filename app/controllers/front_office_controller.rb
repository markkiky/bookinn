class FrontOfficeController < ApplicationController

  # POST room/status
  def room_availability
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
            sql = "SELECT r.id, r.room_name , rs.start_date, rs.end_date FROM rooms r JOIN room_assignments rs ON rs.room_id = r.id"
            @rooms = Room.find_by_sql(sql)

            response = {
              status: 200,
              error: "Valid date",
              data: @rooms,
            }
          rescue ArgumentError
            # handle invalid date
            # byebug
            puts "Invalid date"
            response = {
              status: 400,
              error: "Invalid date",
              data: [],
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

  # POST /arrivals
  def expected_arrivals
    if expected_arrival_params["start_date"].blank?
      # Start date is blank. Use todays date
      @booking_orders = BookingOrder.where(:stay_start_date => Date.today)
      response = {
        status: 200,
        message: "Expected Arrivals for today",
        data: @booking_orders,
      }
    else
      begin
        Date.parse(expected_arrival_params["start_date"])
        if !expected_arrival_params["end_date"].blank?
          Date.parse(expected_arrival_params["end_date"])
        end
        # start date is present. Check for end date
        if expected_arrival_params["end_date"].blank?
          # Only start date is present
          @booking_orders = BookingOrder.where(:stay_start_date => expected_arrival_params["start_date"])
        else
          # Both start date and end date
          # byebug
          @booking_orders = BookingOrder.where(:stay_start_date => expected_arrival_params["start_date"]...expected_arrival_params["end_date"])
          # @booking_orders = BookingOrder.where("stay_start_date > ?", expected_arrival_params["start_date"])
        end
        response = {
          status: 200,
          message: "Expected Arrivals",
          data: @booking_orders,
        }
      rescue => exception
        response = {
          status: 400,
          message: "Invalid date",
          data: [],
        }
      else
      end
    end

    render json: response
  end

  # POST /departures
  def expected_departures
    if expected_arrival_params["start_date"].blank?
      # Start date is blank. Use todays date
      @booking_orders = BookingOrder.where(:stay_end_date => Date.today)
      response = {
        status: 200,
        message: "Expected Departures for today",
        data: @booking_orders,
      }
    else
      begin
        Date.parse(expected_arrival_params["start_date"])
        if !expected_arrival_params["end_date"].blank?
          Date.parse(expected_arrival_params["end_date"])
        end
        # start date is present. Check for end date
        if expected_arrival_params["end_date"].blank?
          # Only start date is present
          @booking_orders = BookingOrder.where(:stay_end_date => expected_arrival_params["start_date"])
        else
          # Both start date and end date
          # byebug
          @booking_orders = BookingOrder.where(:stay_end_date => expected_arrival_params["start_date"]...expected_arrival_params["end_date"])
          # @booking_orders = BookingOrder.where("stay_start_date > ?", expected_arrival_params["start_date"])
        end
        response = {
          status: 200,
          message: "Expected Departures",
          data: @booking_orders,
        }
      rescue => exception
        response = {
          status: 400,
          message: "Invalid date",
          data: [],
        }
      else
      end
    end

    render json: response
  end

  # POST /needs_preferences
  def needs_preferences
    # params['customer_id'] params['need_type_id'] parma
    if Customer.exists?(needs_preferences_params["customer_id"])
      @customer_needs = []
      needs_preferences_params["needs"].each do |need|
        if NeedType.exists?(need["need_type_id"]) && CustomerNeed.where(:customer_id => needs_preferences_params["customer_id"], :need_type_id => need["need_type_id"]).count == 0
          @customer_need = CustomerNeed.new(customer_id: needs_preferences_params["customer_id"], need_type_id: need["need_type_id"])
          @customer_needs << @customer_need
          # byebug
        else
          @errors = {
            message: "Failed to save need",
          }
        end
      end
      # byebug
      @customer_needs.each do |need|
        need.save
      end
      # CustomerNeed.create(@customer_needs)
      # byebug
      # @customer_needs = CustomerNeed.new([customer_id: needs_preferences_params["customer_id"], need_type_id: needs_preferences_params["need_type_id"]])
      response = {
        status: 200,
        message: "Need or preference added successfully",
        data: {
          customer_needs: @customer_needs,
        },
        errors: {
          error: @errors,
        },
      }
    else
      # Customer Id not found
      response = {
        status: 400,
        error: "The specified Customer does not exist",
      }
    end
    render json: response
  end

  # GET /needs_preferences
  def show_needs_preferences
    if !show_needs_preferences_params["customer_id"].blank?
      @customer = Customer.find(show_needs_preferences_params["customer_id"])

      @customer_needs = CustomerNeed.where(:customer_id => @customer.id)
      response = {
        status: 200,
        message: "Customer Needs and Preferences",
        data: @customer_needs,
      }
    else
      response = {
        status: 400,
        message: "Please provide a customer id",
        data: []
      }
    end

    render json: response
  end

  # POST bookinn/walkin
  def walkin_bookinn
    # Creates customer or updates existing customer with email
    # Creates a bookinn
    puts walkin_bookinn_params
    response = {
      status: 200,
      message: "Walkin Bookins",
      data: []

    }
    render json: response
  end


  private

  def walkin_bookinn_params
    params.permit(customer: [
      :customer_id
    ], booking: [
      :booking_order_id
    ])
  end

  def show_needs_preferences_params
    params.permit(:customer_id)
  end

  def needs_preferences_params
    params.permit(:customer_id, :front_office, needs: [
                                                 :need_type_id,
                                               ])
  end

  def expected_arrival_params
    params.permit(:start_date, :end_date)
  end

  def room_status_params
    params.permit(:status, :room_type_id, :start_date, :end_date)
  end
end
