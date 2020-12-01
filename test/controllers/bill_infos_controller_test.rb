require 'test_helper'

class BillInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill_info = bill_infos(:one)
  end

  test "should get index" do
    get bill_infos_url, as: :json
    assert_response :success
  end

  test "should create bill_info" do
    assert_difference('BillInfo.count') do
      post bill_infos_url, params: { bill_info: { bill_date: @bill_info.bill_date, bill_no: @bill_info.bill_no, bill_total: @bill_info.bill_total, customer_id: @bill_info.customer_id } }, as: :json
    end

    assert_response 201
  end

  test "should show bill_info" do
    get bill_info_url(@bill_info), as: :json
    assert_response :success
  end

  test "should update bill_info" do
    patch bill_info_url(@bill_info), params: { bill_info: { bill_date: @bill_info.bill_date, bill_no: @bill_info.bill_no, bill_total: @bill_info.bill_total, customer_id: @bill_info.customer_id } }, as: :json
    assert_response 200
  end

  test "should destroy bill_info" do
    assert_difference('BillInfo.count', -1) do
      delete bill_info_url(@bill_info), as: :json
    end

    assert_response 204
  end
end
