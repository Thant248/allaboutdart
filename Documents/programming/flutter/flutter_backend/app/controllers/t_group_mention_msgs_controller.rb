class TGroupMentionMsgsController < ApplicationController
  before_action :set_t_group_mention_msg, only: %i[ show update destroy ]

  # GET /t_group_mention_msgs
  def index
    @t_group_mention_msgs = TGroupMentionMsg.all

    render json: @t_group_mention_msgs
  end

  # GET /t_group_mention_msgs/1
  def show
    render json: @t_group_mention_msg
  end

  # POST /t_group_mention_msgs
  def create
    @t_group_mention_msg = TGroupMentionMsg.new(t_group_mention_msg_params)

    if @t_group_mention_msg.save
      render json: @t_group_mention_msg, status: :created, location: @t_group_mention_msg
    else
      render json: @t_group_mention_msg.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_group_mention_msgs/1
  def update
    if @t_group_mention_msg.update(t_group_mention_msg_params)
      render json: @t_group_mention_msg
    else
      render json: @t_group_mention_msg.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_group_mention_msgs/1
  def destroy
    @t_group_mention_msg.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_group_mention_msg
      @t_group_mention_msg = TGroupMentionMsg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_group_mention_msg_params
      params.fetch(:t_group_mention_msg, {})
    end
end
