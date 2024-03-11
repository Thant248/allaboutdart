// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      mUser: MUser.fromJson(json['m_user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'm_user': instance.mUser,
    };

MUser _$MUserFromJson(Map<String, dynamic> json) => MUser(
      rememberDigest: json['remember_digest'] as String?,
      profileImage: json['profile_image'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      admin: json['admin'] as String?,
    );

Map<String, dynamic> _$MUserToJson(MUser instance) => <String, dynamic>{
      'remember_digest': instance.rememberDigest,
      'profile_image': instance.profileImage,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'admin': instance.admin,
    };
