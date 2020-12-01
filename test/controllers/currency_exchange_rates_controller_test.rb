require 'test_helper'

class CurrencyExchangeRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency_exchange_rate = currency_exchange_rates(:one)
  end

  test "should get index" do
    get currency_exchange_rates_url, as: :json
    assert_response :success
  end

  test "should create currency_exchange_rate" do
    assert_difference('CurrencyExchangeRate.count') do
      post currency_exchange_rates_url, params: { currency_exchange_rate: { base_currency_id: @currency_exchange_rate.base_currency_id, currency_exchange_rate_id: @currency_exchange_rate.currency_exchange_rate_id, end_date: @currency_exchange_rate.end_date, exchange_rate: @currency_exchange_rate.exchange_rate, exchange_rate_status: @currency_exchange_rate.exchange_rate_status, secondary_currency_id: @currency_exchange_rate.secondary_currency_id, start_date: @currency_exchange_rate.start_date } }, as: :json
    end

    assert_response 201
  end

  test "should show currency_exchange_rate" do
    get currency_exchange_rate_url(@currency_exchange_rate), as: :json
    assert_response :success
  end

  test "should update currency_exchange_rate" do
    patch currency_exchange_rate_url(@currency_exchange_rate), params: { currency_exchange_rate: { base_currency_id: @currency_exchange_rate.base_currency_id, currency_exchange_rate_id: @currency_exchange_rate.currency_exchange_rate_id, end_date: @currency_exchange_rate.end_date, exchange_rate: @currency_exchange_rate.exchange_rate, exchange_rate_status: @currency_exchange_rate.exchange_rate_status, secondary_currency_id: @currency_exchange_rate.secondary_currency_id, start_date: @currency_exchange_rate.start_date } }, as: :json
    assert_response 200
  end

  test "should destroy currency_exchange_rate" do
    assert_difference('CurrencyExchangeRate.count', -1) do
      delete currency_exchange_rate_url(@currency_exchange_rate), as: :json
    end

    assert_response 204
  end
end
