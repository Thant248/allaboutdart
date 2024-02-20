class TDirectThreadsController < ApplicationController
  before_action :set_t_direct_thread, only: %i[ show update destroy ]

  # GET /t_direct_threads
  def index
    @t_direct_threads = TDirectThread.all

    render json: @t_direct_threads
  end

  # GET /t_direct_threads/1
  def show
    render json: @t_direct_thread
  end

  # POST /t_direct_threads
  def create
    @t_direct_thread = TDirectThread.new(t_direct_thread_params)

    if @t_direct_thread.save
      render json: @t_direct_thread, status: :created, location: @t_direct_thread
    else
      render json: @t_direct_thread.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_direct_threads/1
  def update
    if @t_direct_thread.update(t_direct_thread_params)
      render json: @t_direct_thread
    else
      render json: @t_direct_thread.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_direct_threads/1
  def destroy
    @t_direct_thread.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_direct_thread
      @t_direct_thread = TDirectThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_direct_thread_params
      params.fetch(:t_direct_thread, {})
    end
end
