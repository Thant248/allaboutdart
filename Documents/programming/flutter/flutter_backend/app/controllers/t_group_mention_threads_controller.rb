class TGroupMentionThreadsController < ApplicationController
  before_action :set_t_group_mention_thread, only: %i[ show update destroy ]

  # GET /t_group_mention_threads
  def index
    @t_group_mention_threads = TGroupMentionThread.all

    render json: @t_group_mention_threads
  end

  # GET /t_group_mention_threads/1
  def show
    render json: @t_group_mention_thread
  end

  # POST /t_group_mention_threads
  def create
    @t_group_mention_thread = TGroupMentionThread.new(t_group_mention_thread_params)

    if @t_group_mention_thread.save
      render json: @t_group_mention_thread, status: :created, location: @t_group_mention_thread
    else
      render json: @t_group_mention_thread.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_group_mention_threads/1
  def update
    if @t_group_mention_thread.update(t_group_mention_thread_params)
      render json: @t_group_mention_thread
    else
      render json: @t_group_mention_thread.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_group_mention_threads/1
  def destroy
    @t_group_mention_thread.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_group_mention_thread
      @t_group_mention_thread = TGroupMentionThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_group_mention_thread_params
      params.fetch(:t_group_mention_thread, {})
    end
end
