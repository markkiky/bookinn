require 'test_helper'

class BookingOrderTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_order_type = booking_order_types(:one)
  end

  test "should get index" do
    get booking_order_types_url, as: :json
    assert_response :success
  end

  test "should create booking_order_type" do
    assert_difference('BookingOrderType.count') do
      post booking_order_types_url, params: { booking_order_type: { booking_order_type_description: @booking_order_type.booking_order_type_description, booking_order_type_id: @booking_order_type.booking_order_type_id, booking_order_type_status: @booking_order_type.booking_order_type_status } }, as: :json
    end

    assert_response 201
  end

  test "should show booking_order_type" do
    get booking_order_type_url(@booking_order_type), as: :json
    assert_response :success
  end

  test "should update booking_order_type" do
    patch booking_order_type_url(@booking_order_type), params: { booking_order_type: { booking_order_type_description: @booking_order_type.booking_order_type_description, booking_order_type_id: @booking_order_type.booking_order_type_id, booking_order_type_status: @booking_order_type.booking_order_type_status } }, as: :json
    assert_response 200
  end

  test "should destroy booking_order_type" do
    assert_difference('BookingOrderType.count', -1) do
      delete booking_order_type_url(@booking_order_type), as: :json
    end

    assert_response 204
  end
end
