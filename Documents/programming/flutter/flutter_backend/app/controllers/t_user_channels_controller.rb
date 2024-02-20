class TUserChannelsController < ApplicationController
  before_action :set_t_user_channel, only: %i[ show update destroy ]

  # GET /t_user_channels
  def index
    @t_user_channels = TUserChannel.all

    render json: @t_user_channels
  end

  # GET /t_user_channels/1
  def show
    render json: @t_user_channel
  end

  # POST /t_user_channels
  def create
    @t_user_channel = TUserChannel.new(t_user_channel_params)

    if @t_user_channel.save
      render json: @t_user_channel, status: :created, location: @t_user_channel
    else
      render json: @t_user_channel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_user_channels/1
  def update
    if @t_user_channel.update(t_user_channel_params)
      render json: @t_user_channel
    else
      render json: @t_user_channel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_user_channels/1
  def destroy
    @t_user_channel.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_user_channel
      @t_user_channel = TUserChannel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_user_channel_params
      params.fetch(:t_user_channel, {})
    end
end
