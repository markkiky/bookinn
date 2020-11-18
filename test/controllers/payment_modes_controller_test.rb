require 'test_helper'

class PaymentModesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_mode = payment_modes(:one)
  end

  test "should get index" do
    get payment_modes_url, as: :json
    assert_response :success
  end

  test "should create payment_mode" do
    assert_difference('PaymentMode.count') do
      post payment_modes_url, params: { payment_mode: { payment_mode_description: @payment_mode.payment_mode_description, payment_mode_id: @payment_mode.payment_mode_id, payment_mode_status: @payment_mode.payment_mode_status } }, as: :json
    end

    assert_response 201
  end

  test "should show payment_mode" do
    get payment_mode_url(@payment_mode), as: :json
    assert_response :success
  end

  test "should update payment_mode" do
    patch payment_mode_url(@payment_mode), params: { payment_mode: { payment_mode_description: @payment_mode.payment_mode_description, payment_mode_id: @payment_mode.payment_mode_id, payment_mode_status: @payment_mode.payment_mode_status } }, as: :json
    assert_response 200
  end

  test "should destroy payment_mode" do
    assert_difference('PaymentMode.count', -1) do
      delete payment_mode_url(@payment_mode), as: :json
    end

    assert_response 204
  end
end
