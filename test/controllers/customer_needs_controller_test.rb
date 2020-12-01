require 'test_helper'

class CustomerNeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_need = customer_needs(:one)
  end

  test "should get index" do
    get customer_needs_url, as: :json
    assert_response :success
  end

  test "should create customer_need" do
    assert_difference('CustomerNeed.count') do
      post customer_needs_url, params: { customer_need: { created_by: @customer_need.created_by, customer_id: @customer_need.customer_id, need_type_id: @customer_need.need_type_id, updated_by: @customer_need.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_need" do
    get customer_need_url(@customer_need), as: :json
    assert_response :success
  end

  test "should update customer_need" do
    patch customer_need_url(@customer_need), params: { customer_need: { created_by: @customer_need.created_by, customer_id: @customer_need.customer_id, need_type_id: @customer_need.need_type_id, updated_by: @customer_need.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy customer_need" do
    assert_difference('CustomerNeed.count', -1) do
      delete customer_need_url(@customer_need), as: :json
    end

    assert_response 204
  end
end
