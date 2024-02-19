class User {
  String? rememberDigest;
  String? profileImage;
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? admin;

  

  User(
      {this.rememberDigest,
      this.profileImage,
      this.name,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.admin});

  User.fromJson(Map<String, dynamic> json) {
    rememberDigest = json['remember_digest'];
    profileImage = json['profile_image'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remember_digest'] = this.rememberDigest;
    data['profile_image'] = this.profileImage;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['admin'] = this.admin;
    return data;
  }
}
