class TDirectStarThreadsController < ApplicationController
  before_action :set_t_direct_star_thread, only: %i[ show update destroy ]

  # GET /t_direct_star_threads
  def index
    @t_direct_star_threads = TDirectStarThread.all

    render json: @t_direct_star_threads
  end

  # GET /t_direct_star_threads/1
  def show
    render json: @t_direct_star_thread
  end

  # POST /t_direct_star_threads
  def create
    @t_direct_star_thread = TDirectStarThread.new(t_direct_star_thread_params)

    if @t_direct_star_thread.save
      render json: @t_direct_star_thread, status: :created, location: @t_direct_star_thread
    else
      render json: @t_direct_star_thread.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_direct_star_threads/1
  def update
    if @t_direct_star_thread.update(t_direct_star_thread_params)
      render json: @t_direct_star_thread
    else
      render json: @t_direct_star_thread.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_direct_star_threads/1
  def destroy
    @t_direct_star_thread.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_direct_star_thread
      @t_direct_star_thread = TDirectStarThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_direct_star_thread_params
      params.fetch(:t_direct_star_thread, {})
    end
end
