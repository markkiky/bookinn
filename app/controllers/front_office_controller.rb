class FrontOfficeController < ApplicationController
  before_action :authorize_request

  # POST room/status
  def room_availability
    # puts params[:status]

    puts room_status_params
    if room_status_params["status"].blank?
      # return all rooms and their status
      @rooms = Room.all.where(:is_active => 1)
      @rumus = []
      @rooms.each do |room|
        # @room_occupancy = Room.room_occupancy(room.id)
        @room_status = Room.room_status(room.id)
        # byebug
        @room_type = Room.room_type(room.id)
        if room.status == "1" || room.status == "4" || room.status == "5"
          @room = {
            id: room.id,
            room_no: room.room_no,
            room_name: room.room_name,
            room_status: room.status,
            room_status_description: @room_status[:status_description],
            room_type_id: @room_type.id,
            room_type_description: @room_type.room_type_description,
            room_type_status: @room_type.room_type_status,
            room_type_total: @room_type.room_type_total,
          }
        else
          @dates = Room.room_occupancy(room.id)
          # byebug
          @room = {
            id: room.id,
            room_no: room.room_no,
            room_name: room.room_name,
            room_status: room.status,
            room_status_description: @room_status[:status_description],
            room_type_id: @room_type.id,
            room_type_description: @room_type.room_type_description,
            room_type_status: @room_type.room_type_status,
            room_type_total: @room_type.room_type_total,
            stay_start_date: @dates[:stay_start_date].to_date.to_s,
            stay_end_date: @dates[:stay_end_date].to_date.to_s,
          }
        end

        # byebug
        @rumus << @room
      end
      response = {
        status: 200,
        error: "All Rooms and their status",
        data: @rumus,
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
      @booking_response = []
      @booking_orders.each do |order|
        @booking = {
          booking_order_id: order.booking_order_id,
          booking_order_date: order.booking_order_date,
          stay_start_date: order.stay_start_date,
          stay_end_date: order.stay_end_date,
          total_applicants: order.total_applicants,
          customers: BookingOrder.booking_customer(order.id),
        }
        @booking_response << @booking
      end
      response = {
        status: 200,
        message: "Expected Arrivals for today",
        data: @booking_response,
      }
      # byebug
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
        @booking_response = []
        # byebug
        @booking_orders.each do |order|
          @booking = {
            booking_order_id: order.id,
            booking_order_date: order.booking_order_date,
            stay_start_date: order.stay_start_date,
            stay_end_date: order.stay_end_date,
            total_applicants: order.total_applicants,
            customers: BookingOrder.booking_customer(order.id),
          }
          @booking_response << @booking
        end
        response = {
          status: 200,
          message: "Expected Arrivals",
          data: @booking_response,
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
      @booking_response = []
      @booking_orders.each do |order|
        @booking = {
          booking_order_id: order.booking_order_id,
          booking_order_date: order.booking_order_date,
          stay_start_date: order.stay_start_date,
          stay_end_date: order.stay_end_date,
          total_applicants: order.total_applicants,
          customers: BookingOrder.booking_customer(order.id),
        }
        @booking_response << @booking
      end
      response = {
        status: 200,
        message: "Expected Departures for today",
        data: @booking_response,
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
        @booking_response = []
        @booking_orders.each do |order|
          @booking = {
            booking_order_id: order.booking_order_id,
            booking_order_date: order.booking_order_date,
            stay_start_date: order.stay_start_date,
            stay_end_date: order.stay_end_date,
            total_applicants: order.total_applicants,
            customers: BookingOrder.booking_customer(order.id),
          }
          @booking_response << @booking
        end
        response = {
          status: 200,
          message: "Expected Departures",
          data: @booking_response,
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

  def arrivals_departures
    puts expected_arrival_params[]
    if !params["status"].blank?
      n = FrontOfficeController.new
      if params["status"] == "1"
        # redirect_to expected_arrivals_path
        n.expected_arrivals(expected_arrival_params["status"])
      elsif params["status"] == "2"
        # redirect_to expected_departures_path
        n.expected_departures(expected_arrival_params["status"])
      end
    else
      # status is blank
      response = {
        status: 400,
        error: "Status is required",
      }
      render json: response
    end
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
        data: [],
      }
    end

    render json: response
  end

  # POST bookinn/walkin
  def walkin_bookinn
    # Creates customer or updates existing customer with email
    # Creates a bookinn
    # BookingOrder.new()
    # byebug
    @booking_response = []
    @customer_response = []
    @walkin_bookinn_response = []

    # loop through bookings
    walkin_bookinn_params["booking"].each do |bookinn|
      @bookinn = BookingOrder.new(
        booking_order_id: BookingOrder.booking_order_id,
        booking_order_date: Date.parse(bookinn["booking_order_date"]) ? bookinn["booking_order_date"] : Date.today,
        stay_start_date: bookinn["stay_start_date"],
        stay_end_date: bookinn["stay_end_date"],
        total_applicants: bookinn["total_applicants"],
      )
      @bookinn.save
      @booking_response << @bookinn

      # loop through customers in the bookinn
      bookinn["customers"].each do |customer|
        # check if customer exists
        if @customer = Customer.where(:email => customer["email"]).first
          # update customers details
          @customer.update(
            names: "#{customer["first_name"]} #{customer["last_name"]}",
            id_no: customer["id_no"],
            country_id: customer["country_id"],
            phone: customer["phone"],
          )
        else
          @customer = Customer.new(
            customer_id: Customer.customer_id,
            names: "#{customer["first_name"]} #{customer["last_name"]}",
            id_no: customer["id_no"],
            country_id: customer["country_id"],
            phone: customer["phone"],
            email: customer["email"],
          )
        end
        @customer.save
        @customer_response << @customer

        # Save as a booking belonging to particular customer
        CustomerBooking.create(customer_id: @customer.id, booking_order_id: @bookinn.id)
      end
      @booked = {
        booking_order_id: @bookinn.booking_order_id,
        booking_order_date: @bookinn.booking_order_date,
        stay_start_date: @bookinn.stay_start_date,
        stay_end_date: @bookinn.stay_end_date,
        total_applicants: @bookinn.total_applicants,
        customers: @customer_response,
      }
      @walkin_bookinn_response << @booked
      # byebug
      @customer_response = []
    end
    # BookingOrder.new()
    puts walkin_bookinn_params
    # byebug
    response = {
      status: 200,
      message: "Walkin Bookins",
      data: @walkin_bookinn_response,
    }
    # byebug
    render json: response
  end

  # POST /bookinn/1/add_customer
  def add_customer_to_booking
    # if @customer =
    # check if booking exists
    @booking_order = BookingOrder.find_by(:id => params[:id])
    @customer = Customer.find_by(:email => customer_params["email"]) || Customer.find_by(:id_no => customer_params["id_no"])

    if @customer == nil
      # new customer
      @customer = Customer.new(
        customer_params
      )
      @customer.customer_no = Customer.customer_no
      @customer.customer_id = Customer.customer_id
      @customer.save
    else
      # update customer
      @customer.update(
        customer_params
      )
    end
    @customer_booking = CustomerBooking.new(:customer_id => @customer.id, :booking_order_id => @booking_order.id)
    @customer_booking.save
    response = {
      status: 200,
      message: "Adding Customer to Booking",
      data: @customer,
    }
    render json: response
  end

  # POST check_in
  def check_in
    # allow matching each of our customers to a room
    # Create a customer rooms relation that can match multiple customers to a room
    # change the status of assigned rooms to booked in
    # Utilize room_
    # CustomerRoom.new
    @booking_orders = []
    @response = nil
    @customer_bookings_response = []
    puts "Params: "
    puts params

    # verify customer booking is valid
    CustomerBooking.transaction do
      # loop through each assignment
      check_in_params["assignments"].each do |assignment|
        # byebug
        @customer_booking = CustomerBooking.new(:customer_id => assignment["customer_id"], :booking_order_id => assignment["booking_order_id"], :room_id => assignment["room_id"])
        @customer = Customer.find_by(:id => assignment["customer_id"])
        @room = Room.find_by(:id => assignment["room_id"])
        @booking_order = BookingOrder.find_by(:id => assignment["booking_order_id"])
        @booking_orders << assignment["booking_order_id"]
        @bill = BookingOrder.bill_booking(@booking_order.id)
        # byebug
        @customer_booking_response = {
          names: @customer.names,
          room_no: @room.room_no,
          bill_no: @bill[:bill_no],
          bill_amount: @bill[:bill_amount],
          discount: @booking_order.discount,
          sharing: @booking_order.total_applicants,
        }
        @room = Room.find_by(:id => assignment["room_id"])
        if @room
          @room.status = "2"
          @room.save
          @customer_booking.save
          @customer_bookings_response << @customer_booking_response
          @response = {
            status: 200,
            message: "Customer Booking created successfully. Room Assigned",
            data: @customer_bookings_response,
          }
        else
          # @room.errors = ["Room not Found"]
          @response = {
            status: 200,
            message: "Error finding room with ID: #{assignment["room_id"]}",
            data: @room,
          }
        end
      end

      # # Generate bill for the assignments
      # @booking_orders.each do |booking|
      #   BookingOrder.bill_booking(booking)
      # end
    end

    render json: @response
  end

  # POST check_out
  def check_out
    # provide the booking_order and the customer checking out

    response = {
      status: 200,
      message: "Check Out successful",
    }

    render json: response
  end

  def dashboard
    @response = {
      status: 200,
      message: "Dashboard values",
      data: {
        occupied_rooms: "2",
        arrivals: "2",
        departures: "2",
        available_rooms: "2",
      },
    }
    render json: @response
  end

  def upload_customers_csv
    # byebug
    csv_path = params["customer_csv"].path
    # records =
    # CSV.foreach(csv_path, headers: true, :encoding => "ISO-8859-1").map { |row|
    #   byebug
    # }

    table = CSV.parse(File.read(csv_path), headers: true)
    response = {
      status: 200,
    }

    render json: response
  end

  # Creates a booking with many details
  # Generates a bill and bill details
  def mass_booking
    # create booking
    # byebug
    @customer = Customer.find_or_create_by(email: "mark@nouveta.tech")
    begin
      BookingOrder.transaction do
        @booking_order = BookingOrder.new(
          :booking_order_id => BookingOrder.booking_order_id,
          :booking_order_date => Time.now,
          :booking_order_type_id => "3",
          :created_by => @current_user,
          :customer_id => @customer.id
        )
        @booking_order.save

        # create bill
        # byebug
        @bill_info = BillInfo.new(
          :bill_no => BillInfo.bill_no,
          :bill_date => Time.now,
          :bill_total => "",
          :customer_id => @customer.id,
          :created_by => @current_user.id
        )
        @bill_info.save
        # associate bill, booking order and customer
        @customer_booking = CustomerBooking.new(:booking_order_id => @booking_order.id, :customer_id => @customer.id, :bill_info_id => @bill_info.id)
        @customer_booking.save
        mass_booking_params["bookings"].each do |booking|
          puts booking
          @booking_order_detail = BookingOrderDetail.new(
            :booking_order_id => @booking_order.id,
            :room_type_id => booking[:room_type_id],
            :stay_start_date => booking[:stay_start_date],
            :stay_end_date => booking[:stay_end_date],
            :total_applicants => booking[:total_applicants],
          )

          @booking_order_detail.save
          # generate a bill detail
          @bill_detail = BillDetail.new(
            :bill_no => @bill_info.bill_no,
            :bill_info_id => @bill_info.id,
            :room_type_id => @booking_order_detail.room_type_id,
            :booking_order_detail_id => @booking_order_detail.id,
            :amount => RoomType.find_by(:id => @booking_order_detail.room_type_id).room_price.to_i * @booking_order_detail.total_applicants.to_i
          )
          @bill_detail.save
          # compute bill amount
          bill_total = 
          @bill_info.update(:bill_total => @bill_info.bill_total.to_i + @bill_detail.amount.to_i)
        end
      end
      response = {
        status: 200,
        message: "Mass Booking created",
        data: {
          bill: BookingOrder.bills(@booking_order.id)
        },
      }
    rescue ActiveRecord::RecordInvalid => invalid
      response = {
        status: 200,
        message: "Error saving mass booking",
        error: invalid
      }
    end
    
    render json: response
  end

  private

  def mass_booking_params
    params.permit(
      :email,
      :names,
      :phone,
      bookings: [
        :room_type_id,
        :stay_start_date,
        :stay_end_date,
        :total_applicants,
      ],
    )
  end

  def customer_params
    params.permit(:customer_no, :customer_id, :customer_type_id, :country_id, :id_no, :gender, :names, :email, :phone, :customer_address, :postal_code, :address, :customer_status, :customer_status_date, :last_visit, :last_invoice, :last_receipt, :created_by, :updated_by)
  end

  def check_in_params
    params.permit(
      assignments: [
        :customer_id,
        :room_id,
        :booking_order_id,
      ],
    )
  end

  def check_out_params
    params.permit(
      assignments: [
        :customer_id,
        :room_id,
        :booking_order_id,
      ],
    )
  end

  def walkin_bookinn_params
    params.permit(
      booking: [
        :booking_order_id,
        :booking_order_date,
        :stay_start_date,
        :stay_end_date,
        :total_applicants,
        customers: [

          :customer_id,
          :first_name,
          :last_name,
          :gender,
          :id_no,
          :country_id,
          :phone,
          :email,

        ],
      ],
    )
  end

  def walkin_bookinn_param
    params.permit(customer: [
                    :customer_id,
                  ], booking: [
                    :booking_order_id,
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
    params.permit(:status, :start_date, :end_date)
  end

  def room_status_params
    params.permit(:status, :room_type_id, :start_date, :end_date)
  end
end
