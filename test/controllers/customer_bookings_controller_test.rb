require 'test_helper'

class CustomerBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_booking = customer_bookings(:one)
  end

  test "should get index" do
    get customer_bookings_url, as: :json
    assert_response :success
  end

  test "should create customer_booking" do
    assert_difference('CustomerBooking.count') do
      post customer_bookings_url, params: { customer_booking: { booking_order_id: @customer_booking.booking_order_id, created_by: @customer_booking.created_by, customer_id: @customer_booking.customer_id, is_active: @customer_booking.is_active, updated_by: @customer_booking.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_booking" do
    get customer_booking_url(@customer_booking), as: :json
    assert_response :success
  end

  test "should update customer_booking" do
    patch customer_booking_url(@customer_booking), params: { customer_booking: { booking_order_id: @customer_booking.booking_order_id, created_by: @customer_booking.created_by, customer_id: @customer_booking.customer_id, is_active: @customer_booking.is_active, updated_by: @customer_booking.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy customer_booking" do
    assert_difference('CustomerBooking.count', -1) do
      delete customer_booking_url(@customer_booking), as: :json
    end

    assert_response 204
  end
end
