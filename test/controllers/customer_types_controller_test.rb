require 'test_helper'

class CustomerTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_type = customer_types(:one)
  end

  test "should get index" do
    get customer_types_url, as: :json
    assert_response :success
  end

  test "should create customer_type" do
    assert_difference('CustomerType.count') do
      post customer_types_url, params: { customer_type: { customer_type_description: @customer_type.customer_type_description, customer_type_id: @customer_type.customer_type_id, customer_type_status: @customer_type.customer_type_status } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_type" do
    get customer_type_url(@customer_type), as: :json
    assert_response :success
  end

  test "should update customer_type" do
    patch customer_type_url(@customer_type), params: { customer_type: { customer_type_description: @customer_type.customer_type_description, customer_type_id: @customer_type.customer_type_id, customer_type_status: @customer_type.customer_type_status } }, as: :json
    assert_response 200
  end

  test "should destroy customer_type" do
    assert_difference('CustomerType.count', -1) do
      delete customer_type_url(@customer_type), as: :json
    end

    assert_response 204
  end
end
