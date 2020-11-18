require 'test_helper'

class BillItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill_item = bill_items(:one)
  end

  test "should get index" do
    get bill_items_url, as: :json
    assert_response :success
  end

  test "should create bill_item" do
    assert_difference('BillItem.count') do
      post bill_items_url, params: { bill_item: { bill_item_description: @bill_item.bill_item_description, bill_item_id: @bill_item.bill_item_id, bill_item_rate: @bill_item.bill_item_rate, bill_item_status: @bill_item.bill_item_status, bill_item_unit_of_measure_description: @bill_item.bill_item_unit_of_measure_description, bill_item_unit_of_measure_id: @bill_item.bill_item_unit_of_measure_id, created_by: @bill_item.created_by, updated_by: @bill_item.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show bill_item" do
    get bill_item_url(@bill_item), as: :json
    assert_response :success
  end

  test "should update bill_item" do
    patch bill_item_url(@bill_item), params: { bill_item: { bill_item_description: @bill_item.bill_item_description, bill_item_id: @bill_item.bill_item_id, bill_item_rate: @bill_item.bill_item_rate, bill_item_status: @bill_item.bill_item_status, bill_item_unit_of_measure_description: @bill_item.bill_item_unit_of_measure_description, bill_item_unit_of_measure_id: @bill_item.bill_item_unit_of_measure_id, created_by: @bill_item.created_by, updated_by: @bill_item.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy bill_item" do
    assert_difference('BillItem.count', -1) do
      delete bill_item_url(@bill_item), as: :json
    end

    assert_response 204
  end
end
