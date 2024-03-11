class SessionData {
  MWorkspace? mWorkspace;
  List<MUsers>? mUsers;
  CurrentUser? currentUser;
  List<MChannels>? mChannels;
  List<MPChannels>? mPChannels;
  List<int>? directMsgcounts;
  int? allUnreadCount;
  List<int>? mChannelsids;

  SessionData(
      {this.mWorkspace,
      this.mUsers,
      this.currentUser,
      this.mChannels,
      this.mPChannels,
      this.directMsgcounts,
      this.allUnreadCount,
      this.mChannelsids});

  SessionData.fromJson(Map<String, dynamic> json) {
    mWorkspace = json['m_workspace'] != null
        ? new MWorkspace.fromJson(json['m_workspace'])
        : null;
    if (json['m_users'] != null) {
      mUsers = <MUsers>[];
      json['m_users'].forEach((v) {
        mUsers!.add(new MUsers.fromJson(v));
      });
    }
    currentUser = json['current_user'] != null
        ? new CurrentUser.fromJson(json['current_user'])
        : null;
    if (json['m_channels'] != null) {
      mChannels = <MChannels>[];
      json['m_channels'].forEach((v) {
        mChannels!.add(new MChannels.fromJson(v));
      });
    }
    if (json['m_p_channels'] != null) {
      mPChannels = <MPChannels>[];
      json['m_p_channels'].forEach((v) {
        mPChannels!.add(new MPChannels.fromJson(v));
      });
    }
    directMsgcounts = json['direct_msgcounts'].cast<int>();
    allUnreadCount = json['all_unread_count'];
    mChannelsids = json['m_channelsids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mWorkspace != null) {
      data['m_workspace'] = this.mWorkspace!.toJson();
    }
    if (this.mUsers != null) {
      data['m_users'] = this.mUsers!.map((v) => v.toJson()).toList();
    }
    if (this.currentUser != null) {
      data['current_user'] = this.currentUser!.toJson();
    }
    if (this.mChannels != null) {
      data['m_channels'] = this.mChannels!.map((v) => v.toJson()).toList();
    }
    if (this.mPChannels != null) {
      data['m_p_channels'] = this.mPChannels!.map((v) => v.toJson()).toList();
    }
    data['direct_msgcounts'] = this.directMsgcounts;
    data['all_unread_count'] = this.allUnreadCount;
    data['m_channelsids'] = this.mChannelsids;
    return data;
  }
}

class MWorkspace {
  int? id;
  String? workspaceName;
  String? createdAt;
  String? updatedAt;

  MWorkspace({this.id, this.workspaceName, this.createdAt, this.updatedAt});

  MWorkspace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workspaceName = json['workspace_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['workspace_name'] = this.workspaceName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class MUsers {
  int? id;
  String? name;
  String? email;
  String? passwordDigest;
  String? profileImage;
  String? rememberDigest;
  bool? activeStatus;
  bool? admin;
  bool? memberStatus;
  String? createdAt;
  String? updatedAt;

  MUsers(
      {this.id,
      this.name,
      this.email,
      this.passwordDigest,
      this.profileImage,
      this.rememberDigest,
      this.activeStatus,
      this.admin,
      this.memberStatus,
      this.createdAt,
      this.updatedAt});

  MUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    passwordDigest = json['password_digest'];
    profileImage = json['profile_image'];
    rememberDigest = json['remember_digest'];
    activeStatus = json['active_status'];
    admin = json['admin'];
    memberStatus = json['member_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password_digest'] = this.passwordDigest;
    data['profile_image'] = this.profileImage;
    data['remember_digest'] = this.rememberDigest;
    data['active_status'] = this.activeStatus;
    data['admin'] = this.admin;
    data['member_status'] = this.memberStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CurrentUser {
  int? id;
  String? name;
  String? email;
  String? passwordDigest;
  String? profileImage;
  String? rememberDigest;
  String? activeStatus;
  bool? admin;
  bool? memberStatus;
  String? createdAt;
  String? updatedAt;

  CurrentUser(
      {this.id,
      this.name,
      this.email,
      this.passwordDigest,
      this.profileImage,
      this.rememberDigest,
      this.activeStatus,
      this.admin,
      this.memberStatus,
      this.createdAt,
      this.updatedAt});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    passwordDigest = json['password_digest'];
    profileImage = json['profile_image'];
    rememberDigest = json['remember_digest'];
    activeStatus = json['active_status'];
    admin = json['admin'];
    memberStatus = json['member_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password_digest'] = this.passwordDigest;
    data['profile_image'] = this.profileImage;
    data['remember_digest'] = this.rememberDigest;
    data['active_status'] = this.activeStatus;
    data['admin'] = this.admin;
    data['member_status'] = this.memberStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class MChannels {
  int? id;
  String? channelName;
  bool? channelStatus;
  int? messageCount;

  MChannels({this.id, this.channelName, this.channelStatus, this.messageCount});

  MChannels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelName = json['channel_name'];
    channelStatus = json['channel_status'];
    messageCount = json['message_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_name'] = this.channelName;
    data['channel_status'] = this.channelStatus;
    data['message_count'] = this.messageCount;
    return data;
  }
}

class MPChannels {
  int? id;
  String? channelName;
  bool? channelStatus;

  MPChannels({this.id, this.channelName, this.channelStatus});

  MPChannels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelName = json['channel_name'];
    channelStatus = json['channel_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_name'] = this.channelName;
    data['channel_status'] = this.channelStatus;
    return data;
  }
}
