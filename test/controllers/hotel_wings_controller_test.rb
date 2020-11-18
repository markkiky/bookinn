require 'test_helper'

class HotelWingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_wing = hotel_wings(:one)
  end

  test "should get index" do
    get hotel_wings_url, as: :json
    assert_response :success
  end

  test "should create hotel_wing" do
    assert_difference('HotelWing.count') do
      post hotel_wings_url, params: { hotel_wing: { created_by: @hotel_wing.created_by, hotel_wing_id: @hotel_wing.hotel_wing_id, hotel_wing_status: @hotel_wing.hotel_wing_status, updated_by: @hotel_wing.updated_by, wing_description: @hotel_wing.wing_description } }, as: :json
    end

    assert_response 201
  end

  test "should show hotel_wing" do
    get hotel_wing_url(@hotel_wing), as: :json
    assert_response :success
  end

  test "should update hotel_wing" do
    patch hotel_wing_url(@hotel_wing), params: { hotel_wing: { created_by: @hotel_wing.created_by, hotel_wing_id: @hotel_wing.hotel_wing_id, hotel_wing_status: @hotel_wing.hotel_wing_status, updated_by: @hotel_wing.updated_by, wing_description: @hotel_wing.wing_description } }, as: :json
    assert_response 200
  end

  test "should destroy hotel_wing" do
    assert_difference('HotelWing.count', -1) do
      delete hotel_wing_url(@hotel_wing), as: :json
    end

    assert_response 204
  end
end
