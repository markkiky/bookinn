require 'test_helper'

class RoomAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_assignment = room_assignments(:one)
  end

  test "should get index" do
    get room_assignments_url, as: :json
    assert_response :success
  end

  test "should create room_assignment" do
    assert_difference('RoomAssignment.count') do
      post room_assignments_url, params: { room_assignment: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show room_assignment" do
    get room_assignment_url(@room_assignment), as: :json
    assert_response :success
  end

  test "should update room_assignment" do
    patch room_assignment_url(@room_assignment), params: { room_assignment: {  } }, as: :json
    assert_response 200
  end

  test "should destroy room_assignment" do
    assert_difference('RoomAssignment.count', -1) do
      delete room_assignment_url(@room_assignment), as: :json
    end

    assert_response 204
  end
end
