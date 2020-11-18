require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url, as: :json
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { country_id: @customer.country_id, created_by: @customer.created_by, customer_address: @customer.customer_address, customer_email: @customer.customer_email, customer_id: @customer.customer_id, customer_mobile: @customer.customer_mobile, customer_names: @customer.customer_names, customer_no: @customer.customer_no, customer_postcode: @customer.customer_postcode, customer_status: @customer.customer_status, customer_status_date: @customer.customer_status_date, customer_type_id: @customer.customer_type_id, last_invoice: @customer.last_invoice, last_receipt: @customer.last_receipt, last_visit: @customer.last_visit, updated_by: @customer.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show customer" do
    get customer_url(@customer), as: :json
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { country_id: @customer.country_id, created_by: @customer.created_by, customer_address: @customer.customer_address, customer_email: @customer.customer_email, customer_id: @customer.customer_id, customer_mobile: @customer.customer_mobile, customer_names: @customer.customer_names, customer_no: @customer.customer_no, customer_postcode: @customer.customer_postcode, customer_status: @customer.customer_status, customer_status_date: @customer.customer_status_date, customer_type_id: @customer.customer_type_id, last_invoice: @customer.last_invoice, last_receipt: @customer.last_receipt, last_visit: @customer.last_visit, updated_by: @customer.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer), as: :json
    end

    assert_response 204
  end
end
