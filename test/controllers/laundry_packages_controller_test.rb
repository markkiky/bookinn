require 'test_helper'

class LaundryPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laundry_package = laundry_packages(:one)
  end

  test "should get index" do
    get laundry_packages_url, as: :json
    assert_response :success
  end

  test "should create laundry_package" do
    assert_difference('LaundryPackage.count') do
      post laundry_packages_url, params: { laundry_package: { amount: @laundry_package.amount, laundry_description: @laundry_package.laundry_description } }, as: :json
    end

    assert_response 201
  end

  test "should show laundry_package" do
    get laundry_package_url(@laundry_package), as: :json
    assert_response :success
  end

  test "should update laundry_package" do
    patch laundry_package_url(@laundry_package), params: { laundry_package: { amount: @laundry_package.amount, laundry_description: @laundry_package.laundry_description } }, as: :json
    assert_response 200
  end

  test "should destroy laundry_package" do
    assert_difference('LaundryPackage.count', -1) do
      delete laundry_package_url(@laundry_package), as: :json
    end

    assert_response 204
  end
end
