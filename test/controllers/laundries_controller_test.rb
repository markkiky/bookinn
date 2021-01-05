require 'test_helper'

class LaundriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laundry = laundries(:one)
  end

  test "should get index" do
    get laundries_url, as: :json
    assert_response :success
  end

  test "should create laundry" do
    assert_difference('Laundry.count') do
      post laundries_url, params: { laundry: { booking_order_id: @laundry.booking_order_id, customer_id: @laundry.customer_id, laundry_package_id: @laundry.laundry_package_id, laundry_status: @laundry.laundry_status } }, as: :json
    end

    assert_response 201
  end

  test "should show laundry" do
    get laundry_url(@laundry), as: :json
    assert_response :success
  end

  test "should update laundry" do
    patch laundry_url(@laundry), params: { laundry: { booking_order_id: @laundry.booking_order_id, customer_id: @laundry.customer_id, laundry_package_id: @laundry.laundry_package_id, laundry_status: @laundry.laundry_status } }, as: :json
    assert_response 200
  end

  test "should destroy laundry" do
    assert_difference('Laundry.count', -1) do
      delete laundry_url(@laundry), as: :json
    end

    assert_response 204
  end
end
