require 'test_helper'

class BillDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill_detail = bill_details(:one)
  end

  test "should get index" do
    get bill_details_url, as: :json
    assert_response :success
  end

  test "should create bill_detail" do
    assert_difference('BillDetail.count') do
      post bill_details_url, params: { bill_detail: { bill_item_amount: @bill_detail.bill_item_amount, bill_item_discount: @bill_detail.bill_item_discount, bill_item_id: @bill_detail.bill_item_id, bill_item_quantity: @bill_detail.bill_item_quantity, bill_item_rate: @bill_detail.bill_item_rate, bill_no: @bill_detail.bill_no } }, as: :json
    end

    assert_response 201
  end

  test "should show bill_detail" do
    get bill_detail_url(@bill_detail), as: :json
    assert_response :success
  end

  test "should update bill_detail" do
    patch bill_detail_url(@bill_detail), params: { bill_detail: { bill_item_amount: @bill_detail.bill_item_amount, bill_item_discount: @bill_detail.bill_item_discount, bill_item_id: @bill_detail.bill_item_id, bill_item_quantity: @bill_detail.bill_item_quantity, bill_item_rate: @bill_detail.bill_item_rate, bill_no: @bill_detail.bill_no } }, as: :json
    assert_response 200
  end

  test "should destroy bill_detail" do
    assert_difference('BillDetail.count', -1) do
      delete bill_detail_url(@bill_detail), as: :json
    end

    assert_response 204
  end
end
