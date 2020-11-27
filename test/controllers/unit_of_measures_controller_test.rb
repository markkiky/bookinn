require 'test_helper'

class UnitOfMeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_of_measure = unit_of_measures(:one)
  end

  test "should get index" do
    get unit_of_measures_url, as: :json
    assert_response :success
  end

  test "should create unit_of_measure" do
    assert_difference('UnitOfMeasure.count') do
      post unit_of_measures_url, params: { unit_of_measure: { created_by: @unit_of_measure.created_by, unit_description: @unit_of_measure.unit_description, unit_id: @unit_of_measure.unit_id, unit_status: @unit_of_measure.unit_status, updated_by: @unit_of_measure.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show unit_of_measure" do
    get unit_of_measure_url(@unit_of_measure), as: :json
    assert_response :success
  end

  test "should update unit_of_measure" do
    patch unit_of_measure_url(@unit_of_measure), params: { unit_of_measure: { created_by: @unit_of_measure.created_by, unit_description: @unit_of_measure.unit_description, unit_id: @unit_of_measure.unit_id, unit_status: @unit_of_measure.unit_status, updated_by: @unit_of_measure.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy unit_of_measure" do
    assert_difference('UnitOfMeasure.count', -1) do
      delete unit_of_measure_url(@unit_of_measure), as: :json
    end

    assert_response 204
  end
end
