// ignore_for_file: prefer_const_constructors

import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/groupMessage.dart';
import 'package:flutter_frontend/screens/groupMessage/groupThread.dart';
import 'package:flutter_frontend/services/groupMessageService/group_message_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class groupMessage extends StatefulWidget {
  final channelID, channelName;
  final channelStatus;
  const groupMessage({this.channelID, this.channelStatus, this.channelName});

  @override
  State<groupMessage> createState() => _groupMessageState();
}

class _groupMessageState extends State<groupMessage> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  final TextEditingController _sendMessageController = TextEditingController();
  String? GroupMessageName;
  void _groupMessageSend() async {
    String messageText = _sendMessageController.text;
    int channel_id = widget.channelID;
    await sendGroupMessageData(messageText, channel_id);
    if (messageText.isNotEmpty) {
      setState(() {
        GroupMessageName = messageText;
      });
    }
    print(" GroupMessageName");
    print(GroupMessageName);
  }

  groupMessageData? _getUserDetails;

  @override
  void initState() {
    super.initState();
    fetchUserDetailsUpdate();
    print("fetchUserDetailsUpdate");
    print(fetchUserDetailsUpdate);
  }

  Future<void> fetchUserDetailsUpdate() async {
    _getUserDetails = await fetchAlbum(widget.channelID);

    setState(() {
      channelName = _getUserDetails!.mChannel!.channelName.toString();
      memberCount = _getUserDetails!.retrievehome!.mUsers!.length;
      //  Member
    });

    print("_channelName");
    print(channelName);
  }

  String? channelName;
  int? memberCount;
  @override
  Widget build(BuildContext context) {
    int? groupMessageID;
    int? channelID;
    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: navColor,
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            Container(
              child: widget.channelStatus
                  ? Icon(
                      Icons.tag,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "$channelName",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$memberCount,members",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.blue,
              child: FutureBuilder<groupMessageData?>(
                future: fetchAlbum(widget.channelID),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    groupMessageData groupMessageList = snapshot.data!;
                    int groupMessageLength = groupMessageList
                        .retrieveGroupMessage!.tGroupMessages!.length
                        .toInt();
                    print("groupMessageLength");
                    print(groupMessageLength);
                    List<Map<String, Object?>> mention =
                        groupMessageList.retrievehome!.mUsers!.map((e) {
                      return {'id': e.id, 'name': e.name};
                    }).toList();

                    // List<Map<String,dynmaic>> mention = groupMessageList.retrievehome.mUsers.asMap
                    // print("SnapshotData");
                    // print(groupMessage.mChannel!.channelName.toString());
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.83,
                            child: ListView.builder(
                              itemCount: groupMessageLength,
                              itemBuilder: (BuildContext context, int index) {
                                SampleItem? selectedItem;
                                // Star
                                List tgroupMessageId = groupMessageList
                                    .retrieveGroupMessage!.tGroupMessages!
                                    .map((e) => e.id)
                                    .toList();
                                print(tgroupMessageId);
                                List tgroupStarMessageIds = groupMessageList
                                    .retrieveGroupMessage!.tGroupStarMsgids!
                                    .toList();
                                print(tgroupStarMessageIds);
                                bool isStarred = tgroupStarMessageIds.contains(
                                    groupMessageList.retrieveGroupMessage!
                                        .tGroupMessages![index].id);

                                int messageID = groupMessageList
                                    .retrieveGroupMessage!
                                    .tGroupMessages![index]
                                    .id!
                                    .toInt();
                                String message = groupMessageList
                                    .retrieveGroupMessage!
                                    .tGroupMessages![index]
                                    .groupmsg
                                    .toString();
                                String name = groupMessageList
                                    .retrieveGroupMessage!
                                    .tGroupMessages![index]
                                    .name
                                    .toString();
                                String time = groupMessageList
                                    .retrieveGroupMessage!
                                    .tGroupMessages![index]
                                    .createdAt
                                    .toString();
                                DateTime date = DateTime.parse(time);
                                String created_at =
                                    DateFormat('yyyy-MM-dd HH:mm:ss')
                                        .format(date);
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 6, bottom: 6),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: ListTile(
                                      leading: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Center(
                                              child: Text(
                                            name.characters.first.toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))),
                                      title: Container(
                                        margin: EdgeInsets.only(left: 0),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                message,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              subtitle: Text(
                                                created_at,
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      trailing: PopupMenuButton<SampleItem>(
                                        initialValue: selectedItem,
                                        onSelected: (SampleItem item) {
                                          setState(() {
                                            selectedItem = item;
                                          });
                                        },
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<SampleItem>>[
                                          PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemOne,
                                            onTap: () async {
                                              setState(() {
                                                groupMessageID =
                                                    groupMessageList
                                                        .retrieveGroupMessage!
                                                        .tGroupMessages![index]
                                                        .id!
                                                        .toInt();
                                                channelID = groupMessageList
                                                    .retrieveGroupMessage!
                                                    .sChannel!
                                                    .id!
                                                    .toInt();
                                              });
                                              if (tgroupStarMessageIds
                                                  .contains(groupMessageID)) {
                                                try {
                                                  await deleteGroupStarMessage(
                                                      groupMessageID!,
                                                      channelID!);
                                                } catch (e) {
                                                  print(
                                                      'Error deleting star: $e');
                                                }
                                              } else {
                                                await getMessageStar(
                                                    groupMessageID!,
                                                    channelID!);
                                              }
                                            },
                                            // onTap: _groupStarUnstar(groupMessageID!,channelID!),
                                            child: ListTile(
                                                leading: isStarred ?? true
                                                    ? const Icon(Icons.star,
                                                        color: Colors.yellow)
                                                    : const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.black),
                                                title: Text("Star")),
                                          ),
                                          PopupMenuItem<SampleItem>(
                                              value: SampleItem.itemTwo,
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            GpThreadMessage(
                                                              channelID: widget
                                                                  .channelID,
                                                              channelStatus: widget
                                                                  .channelStatus,
                                                              channelName: widget
                                                                  .channelName,
                                                              messageID:
                                                                  messageID,
                                                              message: message,
                                                              name: name,
                                                              time: created_at,
                                                              fname: name
                                                                  .characters
                                                                  .first
                                                                  .toUpperCase(),
                                                            )));
                                              },
                                              child: ListTile(
                                                leading: Icon(Icons.reply),
                                                title: Text('Threads'),
                                              )),
                                          PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemThree,
                                            onTap: () async {
                                              setState(() {
                                                groupMessageID =
                                                    groupMessageList
                                                        .retrieveGroupMessage!
                                                        .tGroupMessages![index]
                                                        .id!
                                                        .toInt();
                                                channelID = groupMessageList
                                                    .retrieveGroupMessage!
                                                    .sChannel!
                                                    .id!
                                                    .toInt();
                                              });
                                              await deleteGroupMessage(
                                                  groupMessageID!, channelID!);
                                            },
                                            child: ListTile(
                                              leading: Icon(Icons.delete),
                                              title: Text('delete'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: FlutterMentions(
                            key: key,
                            suggestionPosition: SuggestionPosition.Top,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(hintText: 'hello'),
                            mentions: [
                              Mention(
                                  trigger: '@',
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                  data: [
                                    {
                                      'id': '61as61fsa',
                                      'display': 'fayeedP',
                                      'full_name': 'Fayeed Pawaskar',
                                    },
                                    {
                                      'id': '61asasgasgsag6a',
                                      'display': 'khaled',
                                      'full_name': 'DJ Khaled',
                                    },
                                    {
                                      'id': 'asfgasga41',
                                      'display': 'markT',
                                      'full_name': 'Mark Twain',
                                    },
                                  ],
                                  matchAll: false,
                                  suggestionBuilder: (data) {
                                    return Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(data['full_name']),
                                              Text('@${data['display']}'),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          //             child: Padding(
                          //         padding: EdgeInsets.all(8.0),
                          //         child: Container(
                          // height: 50.0,
                          // child: Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         padding: EdgeInsets.symmetric(horizontal: 8.0),
                          //         child: FlutterMentions(
                          //           key: key,
                          //           suggestionPosition: SuggestionPosition.Top,
                          //           decoration:InputDecoration(
                          //             hintText:'Type ypur message'
                          //           ),
                          //           mentions: mention.map((m) => '@${m['name']}').toList(),
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(width: 8.0),
                          //     IconButton(
                          //       onPressed: () {
                          //         _groupMessageSend();
                          //       },
                          //       style: ButtonStyle(

                          //         backgroundColor:
                          //             MaterialStateProperty.all<Color>(Colors.blue),
                          //         foregroundColor:
                          //             MaterialStateProperty.all<Color>(Colors.white),
                          //       ),
                          //       icon: Icon(Icons.send,),
                          //     ),
                          //   ],
                          // ),
                          //         ),
                          //       ),

                          //             child: Padding(
                          //         padding: EdgeInsets.all(8.0),
                          //         child: Container(
                          // height: 50.0,
                          // child: Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         padding: EdgeInsets.symmetric(horizontal: 8.0),
                          //         child: TextField(
                          //           controller: _sendMessageController,
                          //           textInputAction: TextInputAction.newline,
                          //           keyboardType: TextInputType.multiline,
                          //           maxLines: null,
                          //           decoration: InputDecoration(
                          //             hintText: 'Type your message...',
                          //             hintStyle: TextStyle(color: Colors.black54),
                          //             border: InputBorder.none,

                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(width: 8.0),
                          //     IconButton(
                          //       onPressed: () {
                          //         _groupMessageSend();
                          //       },
                          //       style: ButtonStyle(

                          //         backgroundColor:
                          //             MaterialStateProperty.all<Color>(Colors.blue),
                          //         foregroundColor:
                          //             MaterialStateProperty.all<Color>(Colors.white),
                          //       ),
                          //       icon: Icon(Icons.send,),
                          //     ),
                          //   ],
                          // ),
                          //         ),
                          //       ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          //  ListTile(
          //     leading: Text("$GroupMessageName"),
          //     title: Text("$GroupMessageName"),
          //     trailing:  IconButton(
          //               icon:  Icon(Icons.more_vert),
          //               onPressed: () {},
          //   ),
          //   )
          // if (GroupMessageName != null)
          // ListTile(
          //   leading: Text("$GroupMessageName"),
          //   title: Text("$GroupMessageName"),
          //   trailing:  IconButton(
          //     icon:  Icon(Icons.more_vert),
          //     onPressed: () {},
          //   ),
          // )
        ],
      ),

      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: Container(
      //     height: 50.0,
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: TextField(
      //             controller: _sendMessageController,
      //             textInputAction: TextInputAction.newline,
      //             keyboardType: TextInputType.multiline,
      //             maxLines: null,
      //             decoration: InputDecoration(
      //               hintText: 'Type your message...',
      //               hintStyle: TextStyle(color: Colors.black54),
      //               border: InputBorder.none,

      //             ),
      //           ),
      //         ),
      //         SizedBox(width: 8.0),
      //         IconButton(
      //           onPressed: () {
      //             _groupMessageSend();
      //           },
      //           style: ButtonStyle(

      //             backgroundColor:
      //                 MaterialStateProperty.all<Color>(Colors.blue),
      //             foregroundColor:
      //                 MaterialStateProperty.all<Color>(Colors.white),
      //           ),
      //           icon: Icon(Icons.send,),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
