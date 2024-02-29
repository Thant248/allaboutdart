class groupMessageData {
  MChannel? mChannel;
  RetrieveGroupMessage? retrieveGroupMessage;
  Retrievehome? retrievehome;

  groupMessageData(
      {this.mChannel, this.retrieveGroupMessage, this.retrievehome});

  groupMessageData.fromJson(Map<String, dynamic> json) {
    mChannel = json['m_channel'] != null
        ? new MChannel.fromJson(json['m_channel'])
        : null;
    retrieveGroupMessage = json['retrieve_group_message'] != null
        ? new RetrieveGroupMessage.fromJson(json['retrieve_group_message'])
        : null;
    retrievehome = json['retrievehome'] != null
        ? new Retrievehome.fromJson(json['retrievehome'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mChannel != null) {
      data['m_channel'] = this.mChannel!.toJson();
    }
    if (this.retrieveGroupMessage != null) {
      data['retrieve_group_message'] = this.retrieveGroupMessage!.toJson();
    }
    if (this.retrievehome != null) {
      data['retrievehome'] = this.retrievehome!.toJson();
    }
    return data;
  }
}

class MChannel {
  int? id;
  String? channelName;
  bool? channelStatus;
  MWorkspace? mWorkspace;

  MChannel({this.id, this.channelName, this.channelStatus, this.mWorkspace});

  MChannel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelName = json['channel_name'];
    channelStatus = json['channel_status'];
    mWorkspace = json['m_workspace'] != null
        ? new MWorkspace.fromJson(json['m_workspace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_name'] = this.channelName;
    data['channel_status'] = this.channelStatus;
    if (this.mWorkspace != null) {
      data['m_workspace'] = this.mWorkspace!.toJson();
    }
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

class RetrieveGroupMessage {
  SChannel? sChannel;
  List<TGroupMessages>? tGroupMessages;
  List<int>? mChannelUsers;
  List<int>? tGroupStarMsgids;
  int? uCount;
  List<TGroupMessageDates>? tGroupMessageDates;
  List<String>? tGroupMessageDatesize;

  RetrieveGroupMessage(
      {this.sChannel,
      this.tGroupMessages,
      this.mChannelUsers,
      this.tGroupStarMsgids,
      this.uCount,
      this.tGroupMessageDates,
      this.tGroupMessageDatesize});

  RetrieveGroupMessage.fromJson(Map<String, dynamic> json) {
    sChannel = json['s_channel'] != null
        ? new SChannel.fromJson(json['s_channel'])
        : null;
    if (json['t_group_messages'] != null) {
      tGroupMessages = <TGroupMessages>[];
      json['t_group_messages'].forEach((v) {
        tGroupMessages!.add(new TGroupMessages.fromJson(v));
      });
    }
    mChannelUsers = json['m_channel_users'].cast<int>();
    tGroupStarMsgids = json['t_group_star_msgids'].cast<int>();
    uCount = json['u_count'];
    if (json['t_group_message_dates'] != null) {
      tGroupMessageDates = <TGroupMessageDates>[];
      json['t_group_message_dates'].forEach((v) {
        tGroupMessageDates!.add(new TGroupMessageDates.fromJson(v));
      });
    }
    tGroupMessageDatesize = json['t_group_message_datesize'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sChannel != null) {
      data['s_channel'] = this.sChannel!.toJson();
    }
    if (this.tGroupMessages != null) {
      data['t_group_messages'] =
          this.tGroupMessages!.map((v) => v.toJson()).toList();
    }
    data['m_channel_users'] = this.mChannelUsers;
    data['t_group_star_msgids'] = this.tGroupStarMsgids;
    data['u_count'] = this.uCount;
    if (this.tGroupMessageDates != null) {
      data['t_group_message_dates'] =
          this.tGroupMessageDates!.map((v) => v.toJson()).toList();
    }
    data['t_group_message_datesize'] = this.tGroupMessageDatesize;
    return data;
  }
}

class SChannel {
  int? id;
  String? channelName;
  bool? channelStatus;
  int? mWorkspaceId;
  String? createdAt;
  String? updatedAt;

  SChannel(
      {this.id,
      this.channelName,
      this.channelStatus,
      this.mWorkspaceId,
      this.createdAt,
      this.updatedAt});

  SChannel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelName = json['channel_name'];
    channelStatus = json['channel_status'];
    mWorkspaceId = json['m_workspace_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_name'] = this.channelName;
    data['channel_status'] = this.channelStatus;
    data['m_workspace_id'] = this.mWorkspaceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TGroupMessages {
  String? name;
  String? groupmsg;
  int? id;
  String? createdAt;
  int? count;

  TGroupMessages(
      {this.name, this.groupmsg, this.id, this.createdAt, this.count});

  TGroupMessages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    groupmsg = json['groupmsg'];
    id = json['id'];
    createdAt = json['created_at'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['groupmsg'] = this.groupmsg;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['count'] = this.count;
    return data;
  }
}

class TGroupMessageDates {
  String? createdDate;
  int? id;

  TGroupMessageDates({this.createdDate, this.id});

  TGroupMessageDates.fromJson(Map<String, dynamic> json) {
    createdDate = json['created_date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_date'] = this.createdDate;
    data['id'] = this.id;
    return data;
  }
}

class Retrievehome {
  List<MUsers>? mUsers;
  List<MChannels>? mChannels;
  List<int>? directMsgcounts;
  int? allUnreadCount;
  List<int>? mChannelsids;

  Retrievehome(
      {this.mUsers,
      this.mChannels,
      this.directMsgcounts,
      this.allUnreadCount,
      this.mChannelsids});

  Retrievehome.fromJson(Map<String, dynamic> json) {
    if (json['m_users'] != null) {
      mUsers = <MUsers>[];
      json['m_users'].forEach((v) {
        mUsers!.add(new MUsers.fromJson(v));
      });
    }
    if (json['m_channels'] != null) {
      mChannels = <MChannels>[];
      json['m_channels'].forEach((v) {
        mChannels!.add(new MChannels.fromJson(v));
      });
    }
    directMsgcounts = json['direct_msgcounts'].cast<int>();
    allUnreadCount = json['all_unread_count'];
    mChannelsids = json['m_channelsids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mUsers != null) {
      data['m_users'] = this.mUsers!.map((v) => v.toJson()).toList();
    }
    if (this.mChannels != null) {
      data['m_channels'] = this.mChannels!.map((v) => v.toJson()).toList();
    }
    data['direct_msgcounts'] = this.directMsgcounts;
    data['all_unread_count'] = this.allUnreadCount;
    data['m_channelsids'] = this.mChannelsids;
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
  String? activeStatus;
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
