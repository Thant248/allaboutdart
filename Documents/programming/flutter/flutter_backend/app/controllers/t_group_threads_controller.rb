class TGroupThreadsController < ApplicationController
  before_action :set_t_group_thread, only: %i[ show update destroy ]

  # GET /t_group_threads
  def index
    @t_group_threads = TGroupThread.all

    render json: @t_group_threads
  end

  # GET /t_group_threads/1
  def show
    render json: @t_group_thread
  end

  # POST /t_group_threads
  def create
    @t_group_thread = TGroupThread.new(t_group_thread_params)

    if @t_group_thread.save
      render json: @t_group_thread, status: :created, location: @t_group_thread
    else
      render json: @t_group_thread.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_group_threads/1
  def update
    if @t_group_thread.update(t_group_thread_params)
      render json: @t_group_thread
    else
      render json: @t_group_thread.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_group_threads/1
  def destroy
    @t_group_thread.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_group_thread
      @t_group_thread = TGroupThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_group_thread_params
      params.fetch(:t_group_thread, {})
    end
end
