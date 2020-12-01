require 'test_helper'

class BookingOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_order = booking_orders(:one)
  end

  test "should get index" do
    get booking_orders_url, as: :json
    assert_response :success
  end

  test "should create booking_order" do
    assert_difference('BookingOrder.count') do
      post booking_orders_url, params: { booking_order: { booking_order_date: @booking_order.booking_order_date, booking_order_id: @booking_order.booking_order_id, booking_order_status: @booking_order.booking_order_status, booking_order_type: @booking_order.booking_order_type, created_by: @booking_order.created_by, customer_id: @booking_order.customer_id, room_type_id: @booking_order.room_type_id, stay_end_date: @booking_order.stay_end_date, stay_start_date: @booking_order.stay_start_date, updated_by: @booking_order.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show booking_order" do
    get booking_order_url(@booking_order), as: :json
    assert_response :success
  end

  test "should update booking_order" do
    patch booking_order_url(@booking_order), params: { booking_order: { booking_order_date: @booking_order.booking_order_date, booking_order_id: @booking_order.booking_order_id, booking_order_status: @booking_order.booking_order_status, booking_order_type: @booking_order.booking_order_type, created_by: @booking_order.created_by, customer_id: @booking_order.customer_id, room_type_id: @booking_order.room_type_id, stay_end_date: @booking_order.stay_end_date, stay_start_date: @booking_order.stay_start_date, updated_by: @booking_order.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy booking_order" do
    assert_difference('BookingOrder.count', -1) do
      delete booking_order_url(@booking_order), as: :json
    end

    assert_response 204
  end
end
