class TGroupMessagesController < ApplicationController
  before_action :set_t_group_message, only: %i[ show update destroy ]

  # GET /t_group_messages
  def index
    @t_group_messages = TGroupMessage.all

    render json: @t_group_messages
  end

  # GET /t_group_messages/1
  def show
    render json: @t_group_message
  end

  # POST /t_group_messages
  def create
    @t_group_message = TGroupMessage.new(t_group_message_params)

    if @t_group_message.save
      render json: @t_group_message, status: :created, location: @t_group_message
    else
      render json: @t_group_message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_group_messages/1
  def update
    if @t_group_message.update(t_group_message_params)
      render json: @t_group_message
    else
      render json: @t_group_message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_group_messages/1
  def destroy
    @t_group_message.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_group_message
      @t_group_message = TGroupMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_group_message_params
      params.fetch(:t_group_message, {})
    end
end
