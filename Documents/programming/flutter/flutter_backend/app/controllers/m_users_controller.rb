class MUsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:login_user,:update, :create]
  def login_user
    m_user = MUser.find_by(name: login_params[:name])
    m_workspace = MWorkspace.joins("INNER JOIN t_user_workspaces ON t_user_workspaces.workspaceid = m_workspaces.id
                                    INNER JOIN m_users ON m_users.id = t_user_workspaces.userid")
                            .where("m_workspaces.workspace_name = ? and m_users.name = ? ", login_params[:workspace_name],  login_params[:name]).take(1)

    if m_user && m_user.authenticate(login_params[:password]) && m_workspace.size > 0
      t_user_workspace = TUserWorkspace.find_by(userid: m_user.id, workspaceid: m_workspace[0].id)
        if t_user_workspace
          if m_user.member_status == true
            # log_in t_user_workspace
            # redirect_to home_path
            @workspaceid = t_user_workspace.workspaceid
            @userid=t_user_workspace.userid
            token = jwt_encode(user_id: m_user.id)
            render json: { token: token }, status: :ok
          else
            # flash.now[:danger] = 'Account Deactivate. Please contact admin.'
            # render 'new'
            render json: { error: 'Account Deactivate. Please contact admin.' }, status: :unauthorized
          end
        else
          # flash.now[:danger] = 'Invalid name/password combination'
          # render 'new'
          render json: { error: 'Invalid name/password combination' }, status: :unauthorized
        end
    else
      # flash.now[:danger] = 'Invalid name/password combination'
      # render 'new'
      render json: { error: 'Invalid name/password combination' }, status: :unauthorized
    end
  end

  def create
    #check login user
    # checkloginuser

    @m_user = MUser.new(user_params)

    @m_workspace = MWorkspace.new
    @m_workspace.workspace_name = @m_user.remember_digest

    @m_channel = MChannel.new
    @m_channel.channel_name = @m_user.profile_image
    @m_channel.channel_status = 1

    @m_user.member_status = 1

    status = true

    @t_workspace = MWorkspace.find_by(id: session[:invite_workspaceid])

    if status &&  @m_user.save
      MUser.where(id: @m_user.id).update_all(remember_digest: nil, profile_image: nil)
    else 
      status = false
    end

    if(@t_workspace.nil?)
      if status && @m_workspace.save
      
      else 
        status = false
      end
    else
      @m_workspace = @t_workspace
    end

    @t_user_workspace = TUserWorkspace.new
    @t_user_workspace.userid = @m_user.id
    @t_user_workspace.workspaceid = @m_workspace.id

    if status && @t_user_workspace.save

    else 
      status = false
    end

    @t_user_channel = TUserChannel.new
    
    @t_channel = MChannel.find_by(channel_name: @m_channel.channel_name, m_workspace_id: @m_workspace.id)
    
    if(@t_channel.nil?)
      @t_user_channel.created_admin = 1
      @m_channel.m_workspace_id = @m_workspace.id

      if status && @m_channel.save
      else 
        status = false
      end
    else
      @t_user_channel.created_admin = 0
      @m_channel = @t_channel
    end

    @t_user_channel.message_count = 0
    @t_user_channel.unread_channel_message = 0
    @t_user_channel.userid = @m_user.id
    @t_user_channel.channelid = @m_channel.id

    if status && @t_user_channel.save
    else 
      status = false
    end

    if(status)
      # flash[:success] = "Signup Complete."
      # redirect_to root_url
      render json: {message: "Sign Up Successful"}, status: :created
    else
      render json:  {error: "Signup Failed."}, status: :unprocessable_entity
    end
  end

  def show
    @m_user = MUser.find_by(id: params[:id])
  
    if @m_user
      render json: @m_user, status: :ok
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  def confirm
    # Check login user
    # checkloginuser
    
    @m_workspace = MWorkspace.find_by(id: params[:workspaceid])
    @m_channel = MChannel.find_by(id: params[:channelid])
  
    @m_user = MUser.new
    @m_user.email = params[:email]
    @m_user.remember_digest = @m_workspace.workspace_name
    @m_user.profile_image = @m_channel.channel_name
    # render json: { message: "Successful." }, status: :ok
  end

  def update
    #check unlogin user
    # checkuser

    @m_user = MUser.new(user_params)
    password = params[:m_user][:password]
    password_confirmation = params[:m_user][:password_confirmation]
    # user_id = 1
    if password == "" || password.nil?
      # flash[:danger] = "Password can't be blank."
      # redirect_to change_password_url(id: session[:user_id])
      render json:  {error: "Password can't be blank."}, status: :unprocessable_entity
    elsif password_confirmation == "" || password_confirmation.nil?
      # flash[:danger] = "Confirm Password can't be blank."
      # redirect_to change_password_url(id: session[:user_id])
      render json:  {error: "Confirm Password can't be blank."}, status: :unprocessable_entity
    elsif password != password_confirmation
      # flash[:danger] = "Password and Confirmation Password does not match."
      # redirect_to change_password_url(id: session[:user_id])
      render json:  {error: "Password and Confirmation Password does not match."}, status: :unprocessable_entity
    else 
      MUser.where(id: @userid).update_all(password_digest: @m_user.password_digest)
      # flash[:success] = "Change Password Successful."
      # redirect_to home_url
      render json: "Change password successfully!", status: :ok
    end
  end
private
  def user_params
    params.require(:m_user).permit(:name, :email, :password,
    :password_confirmation, :profile_image, :remember_digest, :admin)
  end

  def login_params
    params.require(:user).permit(
      :name,
      :password,
      :workspace_name
  )
  end
end
