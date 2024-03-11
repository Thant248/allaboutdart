import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'm_user')
  final MUser mUser;

  User({
    required this.mUser,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class MUser {
  @JsonKey(name: 'remember_digest')
  final String? rememberDigest;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  final String? name;
  final String? email;
  final String? password;
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;
  final String? admin;

  MUser({
    required this.rememberDigest,
    required this.profileImage,
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.admin,
  });

  factory MUser.fromJson(Map<String, dynamic> json) => _$MUserFromJson(json);
  Map<String, dynamic> toJson() => _$MUserToJson(this);
}
