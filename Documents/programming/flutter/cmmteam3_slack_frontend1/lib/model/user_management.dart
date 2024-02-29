class UserManagement {
  List<UserManagesActivate>? userManagesActivate;
  List<UserManagesDeactivate>? userManagesDeactivate;
  List<UserManagesAdmin>? userManagesAdmin;
  MWorkspace? mWorkspace;
  List<MUserer>? mUsers;
  List<MChannels>? mChannels;
  List<MPChannels>? mPChannels;
  List<int>? directMsgcounts;
  int? allUnreadCount;
  List<int>? mChannelsids;

  UserManagement({
    this.userManagesActivate,
    this.userManagesDeactivate,
    this.userManagesAdmin,
    this.mWorkspace,
    this.mUsers,
    this.mChannels,
    this.mPChannels,
    this.directMsgcounts,
    this.allUnreadCount,
    this.mChannelsids,
  });

  UserManagement.fromJson(Map<String, dynamic> json) {
    if (json['user_manages_activate'] != null) {
      userManagesActivate = <UserManagesActivate>[];
      json['user_manages_activate'].forEach((v) {
        userManagesActivate!.add(UserManagesActivate.fromJson(v));
      });
    }
    if (json['user_manages_deactivate'] != null) {
      userManagesDeactivate = <UserManagesDeactivate>[];
      json['user_manages_deactivate'].forEach((v) {
        userManagesDeactivate!.add(UserManagesDeactivate.fromJson(v));
      });
    }
    if (json['user_manages_admin'] != null) {
      userManagesAdmin = <UserManagesAdmin>[];
      json['user_manages_admin'].forEach((v) {
        userManagesAdmin!.add(UserManagesAdmin.fromJson(v));
      });
    }
    mWorkspace = json['m_workspace'] != null
        ? MWorkspace.fromJson(json['m_workspace'])
        : null;
    if (json['m_userer'] != null) {
      mUsers = <MUserer>[];
      json['m_userer'].forEach((v) {
        mUsers!.add(MUserer.fromJson(v));
      });
    }
    if (json['m_channels'] != null) {
      mChannels = <MChannels>[];
      json['m_channels'].forEach((v) {
        mChannels!.add(MChannels.fromJson(v));
      });
    }
    if (json['m_p_channels'] != null) {
      mPChannels = <MPChannels>[];
      json['m_p_channels'].forEach((v) {
        mPChannels!.add(MPChannels.fromJson(v));
      });
    }
    directMsgcounts = json['direct_msgcounts'].cast<int>();
    allUnreadCount = json['all_unread_count'];
    mChannelsids = json['m_channelsids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userManagesActivate != null) {
      data['user_manages_activate'] =
          userManagesActivate!.map((v) => v.toJson()).toList();
    }
    if (userManagesDeactivate != null) {
      data['user_manages_deactivate'] =
          userManagesDeactivate!.map((v) => v.toJson()).toList();
    }
    if (userManagesAdmin != null) {
      data['user_manages_admin'] =
          userManagesAdmin!.map((v) => v.toJson()).toList();
    }
    if (mWorkspace != null) {
      data['m_workspace'] = mWorkspace!.toJson();
    }
    if (mUsers != null) {
      data['m_userer'] = mUsers!.map((v) => v.toJson()).toList();
    }
    if (mChannels != null) {
      data['m_channels'] = mChannels!.map((v) => v.toJson()).toList();
    }
    if (mPChannels != null) {
      data['m_p_channels'] = mPChannels!.map((v) => v.toJson()).toList();
    }
    data['direct_msgcounts'] = directMsgcounts;
    data['all_unread_count'] = allUnreadCount;
    data['m_channelsids'] = mChannelsids;
    return data;
  }
}

class UserManagesActivate {
  int? id;
  String? name;
  String? email;
  bool? memberStatus;
  bool? admin;

  UserManagesActivate(
      {this.id, this.name, this.email, this.memberStatus, this.admin});

  UserManagesActivate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    memberStatus = json['member_status'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['member_status'] = memberStatus;
    data['admin'] = admin;
    return data;
  }
}

class UserManagesDeactivate {
  int? id;
  String? name;
  String? email;
  bool? memberStatus;
  bool? admin;

  UserManagesDeactivate(
      {this.id, this.name, this.email, this.memberStatus, this.admin});

  UserManagesDeactivate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    memberStatus = json['member_status'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['member_status'] = memberStatus;
    data['admin'] = admin;
    return data;
  }
}

class UserManagesAdmin {
  int? id;
  String? name;
  String? email;
  bool? memberStatus;
  bool? admin;

  UserManagesAdmin(
      {this.id, this.name, this.email, this.memberStatus, this.admin});

  UserManagesAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    memberStatus = json['member_status'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['member_status'] = memberStatus;
    data['admin'] = admin;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['workspace_name'] = workspaceName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MUserer {
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

  MUserer({
    this.id,
    this.name,
    this.email,
    this.passwordDigest,
    this.profileImage,
    this.rememberDigest,
    this.activeStatus,
    this.admin,
    this.memberStatus,
    this.createdAt,
    this.updatedAt,
  });

  MUserer.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password_digest'] = passwordDigest;
    data['profile_image'] = profileImage;
    data['remember_digest'] = rememberDigest;
    data['active_status'] = activeStatus;
    data['admin'] = admin;
    data['member_status'] = memberStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['channel_name'] = channelName;
    data['channel_status'] = channelStatus;
    data['message_count'] = messageCount;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['channel_name'] = channelName;
    data['channel_status'] = channelStatus;
    return data;
  }
}
