require 'test_helper'

class PaymentTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_transaction = payment_transactions(:one)
  end

  test "should get index" do
    get payment_transactions_url, as: :json
    assert_response :success
  end

  test "should create payment_transaction" do
    assert_difference('PaymentTransaction.count') do
      post payment_transactions_url, params: { payment_transaction: { bill_no: @payment_transaction.bill_no, booking_order_no: @payment_transaction.booking_order_no, payment_mode_id: @payment_transaction.payment_mode_id, payment_transaction_amount: @payment_transaction.payment_transaction_amount, payment_transaction_date: @payment_transaction.payment_transaction_date, payment_transaction_id: @payment_transaction.payment_transaction_id, payment_transaction_type: @payment_transaction.payment_transaction_type } }, as: :json
    end

    assert_response 201
  end

  test "should show payment_transaction" do
    get payment_transaction_url(@payment_transaction), as: :json
    assert_response :success
  end

  test "should update payment_transaction" do
    patch payment_transaction_url(@payment_transaction), params: { payment_transaction: { bill_no: @payment_transaction.bill_no, booking_order_no: @payment_transaction.booking_order_no, payment_mode_id: @payment_transaction.payment_mode_id, payment_transaction_amount: @payment_transaction.payment_transaction_amount, payment_transaction_date: @payment_transaction.payment_transaction_date, payment_transaction_id: @payment_transaction.payment_transaction_id, payment_transaction_type: @payment_transaction.payment_transaction_type } }, as: :json
    assert_response 200
  end

  test "should destroy payment_transaction" do
    assert_difference('PaymentTransaction.count', -1) do
      delete payment_transaction_url(@payment_transaction), as: :json
    end

    assert_response 204
  end
end
