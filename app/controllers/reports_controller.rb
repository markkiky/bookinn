# controller to Generate different reports
# frozen_string_literal: true

class ReportsController < ApplicationController
  # Gives a report of all mass bookings on the system: Bookings made by channels
  def mass_booking
    @booking_orders = BookingOrder.all.where(booking_order_type_id: "4", is_active: "1")

   
    @bills_response = []
    @booking_orders.each do |booking_order|
      @bill = BillInfo.find_by(:booking_order_id => booking_order.id, :is_active => "1")
      @bills_response << BillInfo.bill_response(@bill.id)
    end
    
    response = {
      status: 200,
      message: "Mass Bookings Bills Report",
      data: @bills_response,
    }
    render json: response
  end

  # Gives a report of all walking bookins on the system: Bookings made by normal customers
  def walkin_booking
    @booking_orders = BookingOrder.where.not(booking_order_type_id: "4").where(is_active: "1")

    @bills_response = []
    @booking_orders.each do |booking_order|
      @bill = BillInfo.find_by(:booking_order_id => booking_order.id, :is_active => "1")
      @bills_response << BillInfo.bill_response(@bill.id)
    end
    response = {
      status: 200,
      message: "Walkin Bookings Report",
      data: @bills_response,
    }

    render json: response
  end

  def all_bookings
    @response_message = "Returning all Booking Orders"
    @bills_response = []
    @booking_orders = BookingOrder.all.where(:is_active => "1")
    @booking_orders.each do |booking_order|
      @bill = BillInfo.find_by(:booking_order_id => booking_order.id, :is_active => "1")
      @bills_response << BillInfo.bill_response(@bill.id)
    end
    response = {
      status: 200,
      message: @response_message,
      data: @bills_response,
    }
    render json: response
  end

  # Gives a report of bookinns based on a particular status
  # GET /report/booking
  def bookings_by_status
    # check status is provided. If present return those that match else return all
    @bills_response = []
    @booking_orders = nil
    if bookings_by_status_params["status"].present?
      if bookings_by_status_params["status"].empty?
        # status present but value is empty
        @response_message = "Empty status provided. Returning all Booking Orders"
        
        @booking_orders = BookingOrder.all.where(:is_active => "1")
        @booking_orders.each do |booking_order|
          @bill = BillInfo.find_by(:booking_order_id => booking_order.id, :is_active => "1")
          @bills_response << BillInfo.bill_response(@bill.id)
        end
        
      else
        # status present value is not empty
        @response_message = "Booking orders with status #{Status.find_by(:id => bookings_by_status_params["status"]).status_description} "
        @booking_orders = BookingOrder.all.where(:booking_order_status => bookings_by_status_params["status"], :is_active => "1")
        @booking_orders.each do |booking_order|
          @bill = BillInfo.find_by(:booking_order_id => booking_order.id, :is_active => "1")
          @bills_response << BillInfo.bill_response(@bill.id)
        end
      end
    else
      # status is not present, return all bookings
      @response_message = "Returning all Booking Orders"

      @booking_orders = BookingOrder.all.where(:is_active => "1")
      @booking_orders.each do |booking_order|
        @bill = BillInfo.find_by(:booking_order_id => booking_order.id, :is_active => "1")
        @bills_response << BillInfo.bill_response(@bill.id)
      end
    end
    bookings_by_status_params["status"]
    response = {
      status: 200,
      message: @response_message,
      data: @bills_response,
    }
    render json: response
  end

  def dashboard
    @response = {
      status: 200,
      message: "Dashboard values",
      data: {
        occupied_rooms: Room.rooms_by_status(2).count,
        arrivals: BookingOrder.expected_arrivals,
        departures: BookingOrder.expected_departures,
        available_rooms: Room.rooms_by_status(1).count,
        in_house_residents: RoomAssignment.all.where(is_active: "1").count,
        monthly_revenue: Report.monthly_revenue,
      },
    }
    render json: @response
    # byebug
    
  end

  private

  def bookings_by_status_params
    params.permit(:status)
  end
end
