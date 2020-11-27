require 'test_helper'

class RoomAmenitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_amenity = room_amenities(:one)
  end

  test "should get index" do
    get room_amenities_url, as: :json
    assert_response :success
  end

  test "should create room_amenity" do
    assert_difference('RoomAmenity.count') do
      post room_amenities_url, params: { room_amenity: { room_amenity_description: @room_amenity.room_amenity_description, room_amenity_id: @room_amenity.room_amenity_id, room_amenity_name: @room_amenity.room_amenity_name } }, as: :json
    end

    assert_response 201
  end

  test "should show room_amenity" do
    get room_amenity_url(@room_amenity), as: :json
    assert_response :success
  end

  test "should update room_amenity" do
    patch room_amenity_url(@room_amenity), params: { room_amenity: { room_amenity_description: @room_amenity.room_amenity_description, room_amenity_id: @room_amenity.room_amenity_id, room_amenity_name: @room_amenity.room_amenity_name } }, as: :json
    assert_response 200
  end

  test "should destroy room_amenity" do
    assert_difference('RoomAmenity.count', -1) do
      delete room_amenity_url(@room_amenity), as: :json
    end

    assert_response 204
  end
end
