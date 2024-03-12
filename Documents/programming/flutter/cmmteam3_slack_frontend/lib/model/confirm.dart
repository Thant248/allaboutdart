class Confirm {
  MUser? mUser;

  Confirm({this.mUser});

  Confirm.fromJson(Map<String, dynamic> json) {
    mUser = json['m_user'] != null ? new MUser.fromJson(json['m_user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mUser != null) {
      data['m_user'] = this.mUser!.toJson();
    }
    return data;
  }
}

class MUser {
  String? email;
  String? profileImage;
  String? rememberDigest;

  MUser({this.email, this.profileImage, this.rememberDigest});

  MUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];

    profileImage = json['profile_image'];
    rememberDigest = json['remember_digest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;

    data['profile_image'] = this.profileImage;
    data['remember_digest'] = this.rememberDigest;

    return data;
  }
}
