require 'test_helper'

class StatusClustersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_cluster = status_clusters(:one)
  end

  test "should get index" do
    get status_clusters_url, as: :json
    assert_response :success
  end

  test "should create status_cluster" do
    assert_difference('StatusCluster.count') do
      post status_clusters_url, params: { status_cluster: { cluster_description: @status_cluster.cluster_description, status_cluster_id: @status_cluster.status_cluster_id } }, as: :json
    end

    assert_response 201
  end

  test "should show status_cluster" do
    get status_cluster_url(@status_cluster), as: :json
    assert_response :success
  end

  test "should update status_cluster" do
    patch status_cluster_url(@status_cluster), params: { status_cluster: { cluster_description: @status_cluster.cluster_description, status_cluster_id: @status_cluster.status_cluster_id } }, as: :json
    assert_response 200
  end

  test "should destroy status_cluster" do
    assert_difference('StatusCluster.count', -1) do
      delete status_cluster_url(@status_cluster), as: :json
    end

    assert_response 204
  end
end
