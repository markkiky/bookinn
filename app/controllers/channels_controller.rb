class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /channels
  def index
    @channels = Channel.all.where(:is_active => 1)
    response = {
      status: 200,
      message: "All Channels",
      data: @channels
    }

    render json: response
  end

  # GET /channels/1
  def show
    response = {
      status: 200,
      message: "Specific Channel",
      data: @channel
    }
    render json: response
  end

  # POST /channels
  def create
    @channel = Channel.new(channel_params)
    @channel.channel_id = Channel.channel_id
    
    if @channel.save
      response = {
        status: 200,
        message: "Channel created Successfully",
        data: @channel
      }
      render json: response, status: :created, location: @channel
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /channels/1
  def update
    if @channel.update(channel_params)
      response = {
        status: 200,
        message: "Channel updated Successfully",
        data: @channel
      }
      render json: response
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /channels/1
  def destroy
    @channel.update(:is_active => 0)

    response = {
      status: 200,
      message: "Channel deleted Successfully",
      data: @channel
    }
    # @channel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_params
      params.require(:channel).permit(:channel_id, :channel_description, :channel_status)
    end
end
