class TUserWorkspacesController < ApplicationController
  before_action :set_t_user_workspace, only: %i[ show update destroy ]

  # GET /t_user_workspaces
  def index
    @t_user_workspaces = TUserWorkspace.all

    render json: @t_user_workspaces
  end

  # GET /t_user_workspaces/1
  def show
    render json: @t_user_workspace
  end

  # POST /t_user_workspaces
  def create
    @t_user_workspace = TUserWorkspace.new(t_user_workspace_params)

    if @t_user_workspace.save
      render json: @t_user_workspace, status: :created, location: @t_user_workspace
    else
      render json: @t_user_workspace.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /t_user_workspaces/1
  def update
    if @t_user_workspace.update(t_user_workspace_params)
      render json: @t_user_workspace
    else
      render json: @t_user_workspace.errors, status: :unprocessable_entity
    end
  end

  # DELETE /t_user_workspaces/1
  def destroy
    @t_user_workspace.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_user_workspace
      @t_user_workspace = TUserWorkspace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_user_workspace_params
      params.fetch(:t_user_workspace, {})
    end
end
