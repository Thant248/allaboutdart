// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      json['name'] as String?,
      json['job'] as String?,
      json['age'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'job': instance.job,
      'age': instance.age,
    };
