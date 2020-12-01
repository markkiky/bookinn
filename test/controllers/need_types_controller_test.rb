require 'test_helper'

class NeedTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @need_type = need_types(:one)
  end

  test "should get index" do
    get need_types_url, as: :json
    assert_response :success
  end

  test "should create need_type" do
    assert_difference('NeedType.count') do
      post need_types_url, params: { need_type: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show need_type" do
    get need_type_url(@need_type), as: :json
    assert_response :success
  end

  test "should update need_type" do
    patch need_type_url(@need_type), params: { need_type: {  } }, as: :json
    assert_response 200
  end

  test "should destroy need_type" do
    assert_difference('NeedType.count', -1) do
      delete need_type_url(@need_type), as: :json
    end

    assert_response 204
  end
end
