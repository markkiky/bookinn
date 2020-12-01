require 'test_helper'

class ChannelTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel_transaction = channel_transactions(:one)
  end

  test "should get index" do
    get channel_transactions_url, as: :json
    assert_response :success
  end

  test "should create channel_transaction" do
    assert_difference('ChannelTransaction.count') do
      post channel_transactions_url, params: { channel_transaction: { channel_transaction_amount: @channel_transaction.channel_transaction_amount, channel_transaction_date: @channel_transaction.channel_transaction_date, channel_transaction_id: @channel_transaction.channel_transaction_id, channel_transaction_type: @channel_transaction.channel_transaction_type } }, as: :json
    end

    assert_response 201
  end

  test "should show channel_transaction" do
    get channel_transaction_url(@channel_transaction), as: :json
    assert_response :success
  end

  test "should update channel_transaction" do
    patch channel_transaction_url(@channel_transaction), params: { channel_transaction: { channel_transaction_amount: @channel_transaction.channel_transaction_amount, channel_transaction_date: @channel_transaction.channel_transaction_date, channel_transaction_id: @channel_transaction.channel_transaction_id, channel_transaction_type: @channel_transaction.channel_transaction_type } }, as: :json
    assert_response 200
  end

  test "should destroy channel_transaction" do
    assert_difference('ChannelTransaction.count', -1) do
      delete channel_transaction_url(@channel_transaction), as: :json
    end

    assert_response 204
  end
end
