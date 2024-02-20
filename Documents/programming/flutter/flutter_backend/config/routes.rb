Rails.application.routes.draw do
  root 'static_pages#welcome'
  get 'welcome' => 'static_pages#welcome'

  get'workspace' => 'm_workspaces#new'

  get 'signin' =>  'sessions#new'
  post 'signin' =>  'sessions#create'

  get 'change_password' => 'change_password#new'

  get 'home' =>  'static_pages#home'

  get 'memberinvite' => 'member_invitation#new'
  post 'memberinvite' => 'member_invitation#invite'
  get 'confirminvitation' => 'm_users#confirm'

  get 'channelcreate' => 'm_channels#new'
  post 'channelcreate' => 'm_channels#create'
  
  get 'channeledit' => 'm_channels#edit'
  get 'delete_channel' => 'm_channels#delete'
  post 'channelupdate'=> 'm_channels#update'

  get 'star' => 't_direct_star_msg#create'
  get 'unstar' => 't_direct_star_msg#destroy'
  get 'starthread' => 't_direct_star_thread#create'
  get 'unstarthread' => 't_direct_star_thread#destroy'

  get 'delete_directmsg' => "direct_message#deletemsg"
  get 'delete_directthread' => "direct_message#deletethread"

  get 'delete_groupmsg' => "group_message#deletemsg"
  get 'delete_groupthread' => "group_message#deletethread"

  get 'groupstar' => 't_group_star_msg#create'
  get 'groupunstar' => 't_group_star_msg#destroy'
  get 'groupstarthread' => 't_group_star_thread#create'
  get 'groupunstarthread' => 't_group_star_thread#destroy'

  get 'starlists' => 'star_lists#show'
  get 'thread' => 'thread#show'
  get 'mentionlists' => 'mention_lists#show'
  get 'allunread' => 'all_unread#show'

  get 'usermanage' => 'user_manage#usermanage'
  get 'edit' => 'user_manage#edit'
  get 'update' => 'user_manage#update'

  get 'channeluser' => 'channel_user#show'
  get 'channeluseradd' => 'channel_user#create'
  get 'channeluserdestroy' => 'channel_user#destroy'
  get 'channeluserjoin' => 'channel_user#join'

  post 'directmsg' => 'direct_message#show'
  post 'directthreadmsg' => 'direct_message#showthread'


  get 'directmsgs/:directMessage_id' => 't_direct_messages#show', as: 'direct_message'
  
  post 'groupmsg' => 'group_message#show'
  post 'groupthreadmsg' => 'group_message#showthread'

  get 'refresh' => 'sessions#refresh'
  get 'updatedirectmsg' => 'sessions#updatedirectmsg'
  get 'updategroupmsg' => 'sessions#updategroupmsg'

  get 'refresh_direct' => 'm_users#refresh_direct'
  get 'refresh_group' => 'm_channels#refresh_group'

  delete 'logout' =>  'sessions#destroy'
  post 'login'=> 'm_users#login_user'  
  get 'groupmsgs/:channel_id' => 'm_channels#show', as: 'group_message'

  resources :m_workspaces
  resources :m_users
  resources :m_channels
  resources :t_direct_messages
  resources :t_group_messages

end
  