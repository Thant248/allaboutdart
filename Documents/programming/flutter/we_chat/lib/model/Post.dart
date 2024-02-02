import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'Post.g.dart';

@JsonSerializable()
class Post {
  int? id;
  int? userId;
  String? title;
  String? body;
  Post(this.id, this.userId, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
