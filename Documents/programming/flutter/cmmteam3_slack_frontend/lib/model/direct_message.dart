class DirectMessages {
  MUser? mUser;
  MUser? sUser;
  List<TDirectMessages>? tDirectMessages;
  List<TempDirectStarMsgids>? tempDirectStarMsgids;
  List<int>? tDirectStarMsgids;

  DirectMessages({
    this.mUser,
    this.sUser,
    this.tDirectMessages,
    this.tempDirectStarMsgids,
    this.tDirectStarMsgids,
  });

  DirectMessages.fromJson(Map<String, dynamic> json) {
    mUser = json['m_user'] != null ? MUser.fromJson(json['m_user']) : null;
    sUser = json['s_user'] != null ? MUser.fromJson(json['s_user']) : null;
    if (json['t_direct_messages'] != null) {
      tDirectMessages = <TDirectMessages>[];
      json['t_direct_messages'].forEach((v) {
        tDirectMessages!.add(TDirectMessages.fromJson(v));
      });
    }
    if (json['temp_direct_star_msgids'] != null) {
      tempDirectStarMsgids = <TempDirectStarMsgids>[];
      json['temp_direct_star_msgids'].forEach((v) {
        tempDirectStarMsgids!.add(TempDirectStarMsgids.fromJson(v));
      });
    }
    // Initialize tDirectStarMsgids to an empty list if it is null
    tDirectStarMsgids = json['t_direct_star_msgids'] != null
        ? List<int>.from(json['t_direct_star_msgids'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mUser != null) {
      data['m_user'] = mUser!.toJson();
    }
    if (sUser != null) {
      data['s_user'] = sUser!.toJson();
    }
    if (tDirectMessages != null) {
      data['t_direct_messages'] =
          tDirectMessages!.map((v) => v.toJson()).toList();
    }
    if (tempDirectStarMsgids != null) {
      data['temp_direct_star_msgids'] =
          tempDirectStarMsgids!.map((v) => v.toJson()).toList();
    }
    data['t_direct_star_msgids'] = tDirectStarMsgids;
    return data;
  }
}

class MUser {
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

  MUser(
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

  MUser.fromJson(Map<String, dynamic> json) {
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

class TDirectMessages {
  String? name;
  String? directmsg;
  int? id;
  String? createdAt;
  int? count;

  TDirectMessages(
      {this.name, this.directmsg, this.id, this.createdAt, this.count});

  TDirectMessages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    directmsg = json['directmsg'];
    id = json['id'];
    createdAt = json['created_at'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['directmsg'] = this.directmsg;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['count'] = this.count;
    return data;
  }
}

class TempDirectStarMsgids {
  int? directmsgid;
  int? id;

  TempDirectStarMsgids({this.directmsgid, this.id});

  TempDirectStarMsgids.fromJson(Map<String, dynamic> json) {
    directmsgid = json['directmsgid'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['directmsgid'] = this.directmsgid;
    data['id'] = this.id;
    return data;
  }
}

class TDirectMessageDates {
  String? createdDate;
  int? id;

  TDirectMessageDates({this.createdDate, this.id});

  TDirectMessageDates.fromJson(Map<String, dynamic> json) {
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
