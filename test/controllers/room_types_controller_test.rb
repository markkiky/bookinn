require 'test_helper'

class RoomTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_type = room_types(:one)
  end

  test "should get index" do
    get room_types_url, as: :json
    assert_response :success
  end

  test "should create room_type" do
    assert_difference('RoomType.count') do
      post room_types_url, params: { room_type: { room_type_description: @room_type.room_type_description, room_type_id: @room_type.room_type_id } }, as: :json
    end

    assert_response 201
  end

  test "should show room_type" do
    get room_type_url(@room_type), as: :json
    assert_response :success
  end

  test "should update room_type" do
    patch room_type_url(@room_type), params: { room_type: { room_type_description: @room_type.room_type_description, room_type_id: @room_type.room_type_id } }, as: :json
    assert_response 200
  end

  test "should destroy room_type" do
    assert_difference('RoomType.count', -1) do
      delete room_type_url(@room_type), as: :json
    end

    assert_response 204
  end
end
