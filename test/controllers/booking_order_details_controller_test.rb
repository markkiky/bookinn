require 'test_helper'

class BookingOrderDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_order_detail = booking_order_details(:one)
  end

  test "should get index" do
    get booking_order_details_url, as: :json
    assert_response :success
  end

  test "should create booking_order_detail" do
    assert_difference('BookingOrderDetail.count') do
      post booking_order_details_url, params: { booking_order_detail: { booking_order_id: @booking_order_detail.booking_order_id, room_type_id: @booking_order_detail.room_type_id, stay_end_date: @booking_order_detail.stay_end_date, stay_start_date: @booking_order_detail.stay_start_date } }, as: :json
    end

    assert_response 201
  end

  test "should show booking_order_detail" do
    get booking_order_detail_url(@booking_order_detail), as: :json
    assert_response :success
  end

  test "should update booking_order_detail" do
    patch booking_order_detail_url(@booking_order_detail), params: { booking_order_detail: { booking_order_id: @booking_order_detail.booking_order_id, room_type_id: @booking_order_detail.room_type_id, stay_end_date: @booking_order_detail.stay_end_date, stay_start_date: @booking_order_detail.stay_start_date } }, as: :json
    assert_response 200
  end

  test "should destroy booking_order_detail" do
    assert_difference('BookingOrderDetail.count', -1) do
      delete booking_order_detail_url(@booking_order_detail), as: :json
    end

    assert_response 204
  end
end
