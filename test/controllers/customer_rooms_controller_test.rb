require 'test_helper'

class CustomerRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_room = customer_rooms(:one)
  end

  test "should get index" do
    get customer_rooms_url, as: :json
    assert_response :success
  end

  test "should create customer_room" do
    assert_difference('CustomerRoom.count') do
      post customer_rooms_url, params: { customer_room: { created_by: @customer_room.created_by, customer_id: @customer_room.customer_id, room_id: @customer_room.room_id, updated_by: @customer_room.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_room" do
    get customer_room_url(@customer_room), as: :json
    assert_response :success
  end

  test "should update customer_room" do
    patch customer_room_url(@customer_room), params: { customer_room: { created_by: @customer_room.created_by, customer_id: @customer_room.customer_id, room_id: @customer_room.room_id, updated_by: @customer_room.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy customer_room" do
    assert_difference('CustomerRoom.count', -1) do
      delete customer_room_url(@customer_room), as: :json
    end

    assert_response 204
  end
end
