// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';

import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/direct_message_thread.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/directMessage/directMessageThread/direct_message_thread.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';

class DirectMessageThreadWiget extends StatefulWidget {
  final int directMsgId;
  final String receiverName;
  final int receiverId;
  const DirectMessageThreadWiget({
    Key? key,
    required this.directMsgId,
    required this.receiverName,
    required this.receiverId,
  }) : super(key: key);

  @override
  State<DirectMessageThreadWiget> createState() => _DirectMessageThreadState();
}

class _DirectMessageThreadState extends State<DirectMessageThreadWiget>
    with RouteAware {
  final DirectMsgThreadService _apiService = DirectMsgThreadService(Dio());
  final TextEditingController replyTextConotroller = TextEditingController();
  StreamController<DirectMessageThread> _controller =
      StreamController<DirectMessageThread>();
  int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();

  int? selectedIndex;

  bool isLoading = false;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _starFecting();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    replyTextConotroller.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _starFecting();
  }

  Future<void> sendReplyMessage() async {
    Map<String, dynamic> requestBody = {
      "s_direct_message_id": widget.directMsgId,
      "s_user_id": widget.receiverId,
      "message": replyTextConotroller.text,
      "user_id": currentUserId
    };
    if (replyTextConotroller.text.isNotEmpty) {
      var token = await getToken();
      await _apiService.sentThread(requestBody, token!);
      replyTextConotroller.clear();
    }
  }

  Future<void> starMsgReply(int threadId) async {
    var token = await getToken();
    await _apiService.starThread(
        widget.receiverId, currentUserId, threadId, widget.directMsgId, token!);
  }

  Future<void> unStarReply(int threadId) async {
    var token = await getToken();
    await _apiService.unstarThread(
        widget.directMsgId, widget.receiverId, threadId, currentUserId, token!);
  }

  Future<void> deleteReply(int threadId) async {
    var token = await getToken();
    await _apiService.deleteThread(
        widget.directMsgId, widget.receiverId, threadId, token!);
  }

  void _starFecting() async {
    if (!isLoading) {
      _timer = Timer.periodic(const Duration(seconds: 6), (timer) async {
        try {
          final token = await getToken();
          DirectMessageThread directMessageThread =
              await _apiService.getAllThread(widget.directMsgId, token!);
          _controller.add(directMessageThread);
        } catch (e) {
          throw e;
        }
      });
    }
  }

  Future<String?> getToken() async {
    return await AuthController().getToken();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _controller.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ProgressionBar(
              imageName: 'loading.json', height: 200, size: 200);
        } else {
          var messageInfo = snapshot.data;
          String messages =
              snapshot.data!.tDirectMessage!.directmsg!.toString();
          int maxLines = (messages.length / 25).ceil();
          int replyLength = snapshot.data!.tDirectThreads!.length.toInt();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.read_more)),
                )
              ],
              title: const Text(
                'Thread',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Make it a circle
                      border:
                          Border.all(color: Colors.black), // Transparent border
                      color: Colors.transparent, // Transparent background
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.amber,
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      widget.receiverName.characters.first
                                          .toUpperCase(),
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.receiverName,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  messages,
                                  maxLines: maxLines,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '${replyLength} reply',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: replyLength,
                      itemBuilder: (context, index) {
                        String replyMessages = messageInfo!
                            .tDirectThreads![index].directthreadmsg
                            .toString();
                        String name =
                            messageInfo!.tDirectThreads![index].name.toString();
                        String currentUserName = SessionStore
                            .sessionData!.currentUser!.name
                            .toString();
                        int replyMessagesIds =
                            messageInfo.tDirectThreads![index].id!.toInt();
                        List<int> replyStarMsgId =
                            messageInfo.tDirectStarThreadMsgids!.toList();
                        bool isStareds =
                            replyStarMsgId.contains(replyMessagesIds);

                        return GestureDetector(
                          onTapDown: (details) {
                            final RenderBox ovelay = Overlay.of(context)!
                                .context
                                .findRenderObject() as RenderBox;
                            final RelativeRect position = RelativeRect.fromRect(
                                Rect.fromPoints(details.globalPosition,
                                    details.globalPosition),
                                Offset.zero & ovelay.size);

                            showMenu(
                                context: context,
                                position: position,
                                elevation: 8.0,
                                items: [
                                  PopupMenuItem(
                                    value: 'Star',
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            setState(() {
                                              selectedIndex = replyMessagesIds;
                                            });
                                            if (isStareds) {
                                              await unStarReply(selectedIndex!);
                                            } else {
                                              await starMsgReply(
                                                  selectedIndex!);
                                            }
                                          },
                                          icon: const Icon(Icons.star),
                                          color: isStareds
                                              ? Colors.yellow
                                              : Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text('Star'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'Delete',
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              await deleteReply(selectedIndex!);
                                            },
                                            icon: const Icon(Icons.delete)),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text('Delete'),
                                      ],
                                    ),
                                  )
                                ]);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: Text(
                                            name.characters.first.toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: const TextStyle(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        replyMessages,
                                        maxLines: maxLines,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: replyTextConotroller,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      cursorColor: kPrimaryColor,
                      decoration: const InputDecoration(
                        hintText: "Type Messages",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.message),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState() {
                        isLoading = !isLoading;
                      }

                      sendReplyMessage();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.only(right: 25),
                      child: const Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
