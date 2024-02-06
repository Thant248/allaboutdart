import 'dart:convert';
class Tag {
  String channelName;
  bool  statusFlag;
  Tag(this.channelName, this.statusFlag);
  factory Tag.fromJson(dynamic json) {
    return Tag(json['channelName'] as String, json['statusFlag'] as bool);
  }
  @override
  String toString() {
    return '{ ${this.channelName}, ${this.statusFlag} }';
  }
}