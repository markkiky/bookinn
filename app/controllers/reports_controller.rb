# controller to Generate different reports
# frozen_string_literal: true

class ReportsController < ApplicationController
  # Gives a report of all mass bookings on the system: Bookings made by channels
  def mass_booking
    @booking_orders = BookingOrder.all.where(booking_order_type_id: "4", is_active: "1")

    @booking_orders_response = []

    @booking_orders.each do |booking_order|
      @bills = BillInfo.where(:booking_order_id => booking_order.id)
      @bills_response = []
      @bills.each do |bill|
        @bill_details = BillDetail.where(bill_info_id: bill.id, is_active: "1")
        @bill_details_response = []

        @bill_details.each do |bill_detail|
          @bill_detail = {
            bill_detail_id: bill_detail.id,
          }
          @bill_details_response << @bill_detail
        end
        @bill = {
          bill_no: bill.bill_no,
          bill_detail: @bill_details_response,
        }
        @bills_response << @bill
      end
      @booking_order = {
        booking_order_id: booking_order.id,
        booking_no: booking_order.booking_no,
        customer: booking_order.customer_id ? Customer.find_by(:id => booking_order.customer_id).names : "Customer not found",
        bills: @bills_response,
      # bill_total: BillInfo.where(:booking_order_id => booking_order.id).bill_total,
      # reducing_balance: BillInfo.where(:booking_order_id => booking_order.id).reducing_balance,
      }
      @booking_orders_response << @booking_order
    end
    # byebug
    response = {
      status: 200,
      message: "Mass Bookings Report",
      data: @booking_orders_response,
    }
    render json: response
  end

  # Gives a report of all walking bookins on the system: Bookings made by normal customers
  def walkin_booking
    @booking_order = BookingOrder.where.not(booking_order_type_id: "4").where(is_active: "1")

    response = {
      status: 200,
      message: "Walkin Bookings Report",
      data: @booking_order,
    }

    render json: response
  end

  # Gives a report of bookinns based on a particular status
  # GET /report/booking
  def bookings_by_status
    # check status is provided. If present return those that match else return all
    @booking_orders = nil
    if bookings_by_status_params["status"].present?
      if bookings_by_status_params["status"].empty?
        # status present but value is empty
        @response_message = "Empty status provided. Returning all Booking Orders"
        @booking_orders = BookingOrder.all.where(:is_active => "1")
      else
        # status present value is not empty
        @response_message = "Booking orders with status #{Status.find_by(:id => bookings_by_status_params["status"]).status_description} "
        @booking_orders = BookingOrder.all.where(:booking_order_status => bookings_by_status_params["status"], :is_active => "1")
      end
    else
      # status is not present, return all bookings
      @response_message = "Returning all Booking Orders"

      @booking_orders = BookingOrder.all.where(:is_active => "1")
    end
    bookings_by_status_params["status"]
    response = {
      status: 200,
      message: @response_message,
      data: @booking_orders,
    }
    render json: response
  end

  private

  def bookings_by_status_params
    params.permit(:status)
  end
end
