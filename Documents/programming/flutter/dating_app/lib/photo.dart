import 'dart:convert';
import 'package:dating_app/tag.dart';
import 'package:flutter/material.dart';

class channelList extends StatefulWidget {
  @override
  _createChanneLList createState() => _createChanneLList();
}

class _createChanneLList extends State<channelList> {
  String arrayObjsText =
      '{"tags": [{"channelName": "dart", "statusFlag": true}, {"channelName": "flutter", "statusFlag": false}, {"channelName": "json", "statusFlag": false}]}';

  @override
  Widget build(BuildContext context) {
    var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
    List<Tag> tagObjs =
        tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();

    return Column(
      children: [
        ExpansionTile(
          title: const Text("Channels"),
          children: _buildExpandableContent(tagObjs),
        ),
        ExpansionTile(
          title: const Text("Channels"),
          children: _buildExpandableContent(tagObjs),
        ),
        ExpansionTile(
          title: const Text("Channels"),
          children: _buildExpandableContent(tagObjs),
        ),
      ],
    );
  }

  List<Widget> _buildExpandableContent(List<Tag> channels) {
    List<Widget> columnContent = [];
    for (var channel in channels) {
      columnContent.add(
        ListTile(
          leading: channel.statusFlag == true
              ? const Icon(Icons.tag)
              : const Icon(Icons.lock),
          title:
              Text(channel.channelName, style: const TextStyle(fontSize: 18.0)),
        ),
      );
    }
    return columnContent;
  }
}
