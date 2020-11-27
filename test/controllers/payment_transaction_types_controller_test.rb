require 'test_helper'

class PaymentTransactionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_transaction_type = payment_transaction_types(:one)
  end

  test "should get index" do
    get payment_transaction_types_url, as: :json
    assert_response :success
  end

  test "should create payment_transaction_type" do
    assert_difference('PaymentTransactionType.count') do
      post payment_transaction_types_url, params: { payment_transaction_type: { payment_transaction_type_description: @payment_transaction_type.payment_transaction_type_description, payment_transaction_type_id: @payment_transaction_type.payment_transaction_type_id, payment_transaction_type_status: @payment_transaction_type.payment_transaction_type_status } }, as: :json
    end

    assert_response 201
  end

  test "should show payment_transaction_type" do
    get payment_transaction_type_url(@payment_transaction_type), as: :json
    assert_response :success
  end

  test "should update payment_transaction_type" do
    patch payment_transaction_type_url(@payment_transaction_type), params: { payment_transaction_type: { payment_transaction_type_description: @payment_transaction_type.payment_transaction_type_description, payment_transaction_type_id: @payment_transaction_type.payment_transaction_type_id, payment_transaction_type_status: @payment_transaction_type.payment_transaction_type_status } }, as: :json
    assert_response 200
  end

  test "should destroy payment_transaction_type" do
    assert_difference('PaymentTransactionType.count', -1) do
      delete payment_transaction_type_url(@payment_transaction_type), as: :json
    end

    assert_response 204
  end
end
