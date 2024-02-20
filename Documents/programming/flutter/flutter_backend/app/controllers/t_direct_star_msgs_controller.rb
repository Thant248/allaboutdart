class TDirectStarMsgsController < ApplicationController
  before_action :set_t_direct_star_msg, only: %i[ show update destroy ]

  # GET /t_direct_star_msgs
  def index
    @t_direct_star_msgs = TDirectStarMsg.all

    render json: @t_direct_star_msgs
  end

  # GET /t_direct_star_msgs/1
  def show
    render json: @t_direct_star_msg
  end

  # POST /t_direct_star_msgs
  def create
    @t_direct_star_msg = TDirectStarMsg.new(t_direct_star_msg_params)

    if @t_direct_star_msg.save
      render json: @t_direct_star_msg, status: :created, location: @t_direct_star_msg
    else
      render json: @t_direct_star_msg.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_direct_star_msgs/1
  def update
    if @t_direct_star_msg.update(t_direct_star_msg_params)
      render json: @t_direct_star_msg
    else
      render json: @t_direct_star_msg.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_direct_star_msgs/1
  def destroy
    @t_direct_star_msg.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_direct_star_msg
      @t_direct_star_msg = TDirectStarMsg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_direct_star_msg_params
      params.fetch(:t_direct_star_msg, {})
    end
end
