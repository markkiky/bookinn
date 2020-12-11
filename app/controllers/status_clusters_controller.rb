class StatusClustersController < ApplicationController
  before_action :set_status_cluster, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /status_clusters
  def index
    @status_clusters = StatusCluster.all.where(:is_active => 1)

    response = {
      status: 200,
      message: "All Status Clusters",
      data: @status_clusters,
    }

    render json: response
  end

  # GET /status_clusters/1
  def show
    response = {
      status: 200,
      message: "Specific Status Cluster",
      data: @status_cluster,
    }
    render json: response
  end

  # POST /status_clusters
  def create
    @status_cluster = StatusCluster.new(status_cluster_params)

    if @status_cluster.save
      response = {
        status: 200,
        message: "Created status Cluster successfully",
        data: @status_cluster,
      }
      render json: response, status: :created, location: @status_cluster
    else
      render json: @status_cluster.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /status_clusters/1
  def update
    if @status_cluster.update(status_cluster_params)
      response = {
        status: 200,
        message: "Updated status Cluster successfully",
        data: @status_cluster,
      }
      render json: response
    else
      render json: @status_cluster.errors, status: :unprocessable_entity
    end
  end

  # DELETE /status_clusters/1
  def destroy
    @status_cluster.update(:is_active => 0)
    # @status_cluster.destroy
    response = {
      status: 200,
      message: "Status Cluster deleted successfully",
      data: @status_cluster,
    }

    render json: response
  end

  # GET /status/1
  def status
    if @statuses = Status.all.where(:status_cluster_id => params[:id])

      if @status = StatusCluster.find_by(:id => params[:id])
        @status = @status.cluster_description.capitalize
      end
      response = {
        status: 200,
        message: "Statuses in Cluster: #{@status}",
        data: @statuses,
      }
    else
      response = {
        status: 200,
        message: "No Statuses Found in the specified Cluster",
        data: [],
      }
    end
    render json: response
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status_cluster
    @status_cluster = StatusCluster.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def status_cluster_params
    params.require(:status_cluster).permit(:status_cluster_id, :cluster_description)
  end
end
