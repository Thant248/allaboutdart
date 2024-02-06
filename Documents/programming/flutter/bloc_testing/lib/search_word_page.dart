import 'dart:convert';
import 'package:bloc_testing/tag.dart';
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
    List<Widget> columnContent = [];
    return Scaffold(
        body: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text("Channels"),
          children: [
            Column(
              children: _buildExpandableContent(tagObjs),
            )
          ],
        );
      },
    ));
  }

  List<Widget> _buildExpandableContent(channel) {
    List<Widget> columnContent = [];
    channel.map((user) {
      columnContent.add(
        ListTile(
          leading: user.statusFlag == true ? Icon(Icons.tag) : Icon(Icons.lock),
          title: Text(user.channelName, style: TextStyle(fontSize: 18.0)),
        ),
      );
    }).toList();
    return columnContent;
  }
}
