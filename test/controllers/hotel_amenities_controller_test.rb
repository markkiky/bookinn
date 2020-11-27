require 'test_helper'

class HotelAmenitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_amenity = hotel_amenities(:one)
  end

  test "should get index" do
    get hotel_amenities_url, as: :json
    assert_response :success
  end

  test "should create hotel_amenity" do
    assert_difference('HotelAmenity.count') do
      post hotel_amenities_url, params: { hotel_amenity: { hotelAmenityId: @hotel_amenity.hotelAmenityId } }, as: :json
    end

    assert_response 201
  end

  test "should show hotel_amenity" do
    get hotel_amenity_url(@hotel_amenity), as: :json
    assert_response :success
  end

  test "should update hotel_amenity" do
    patch hotel_amenity_url(@hotel_amenity), params: { hotel_amenity: { hotelAmenityId: @hotel_amenity.hotelAmenityId } }, as: :json
    assert_response 200
  end

  test "should destroy hotel_amenity" do
    assert_difference('HotelAmenity.count', -1) do
      delete hotel_amenity_url(@hotel_amenity), as: :json
    end

    assert_response 204
  end
end
