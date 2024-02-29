import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/directMessage/chat_buble.dart';
import 'package:flutter_frontend/services/directMessage/direct_message_api.dart';

class DirectMessageWidget extends StatefulWidget {
  final int userId;
  final String receiverName;
  const DirectMessageWidget(
      {super.key, required this.userId, required this.receiverName});

  @override
  State<DirectMessageWidget> createState() => _DirectMessageWidgetState();
}

class _DirectMessageWidgetState extends State<DirectMessageWidget> {
  DirectMessageService directMessageService = DirectMessageService();
  int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Provider.of<DirectMessageProvider>(context, listen: false)
      //     .getAllMessages(1);
    });

    Timer.periodic(Duration(seconds: 5), (timer) {
      directMessageService.getAllDirectMessages(1);
    });
  }

  TextEditingController messageTextController = TextEditingController();

  void sendMessage() async {
    if (messageTextController.text.isNotEmpty) {
      await directMessageService.sendDirectMessage(
          widget.userId, messageTextController.text);
      messageTextController.clear();
      // Fetch latest messages after sending message
      //   Provider.of<DirectMessageProvider>(context, listen: false)
      //       .getAllMessages(1);
      // }
    }
  }

  void sendThread() async {
    if (messageTextController.text.isNotEmpty) {
      await directMessageService.sendDirectMessageThread(
          1, widget.userId, messageTextController.text);
      messageTextController.clear();
      // Fetch latest messages after sending thread
      //   Provider.of<DirectMessageProvider>(context, listen: false)
      //       .getAllMessages(1);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const BackButton(),
              Container(
                decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: Colors.black),
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    widget.receiverName.isNotEmpty
                        ? "${widget.receiverName.characters.first.toUpperCase()}"
                        : "",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.receiverName}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Text(
                    "Active 3m ago",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
        body: StreamBuilder(
          stream: directMessageService.getAllDirectMessages(1),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const ProgressionBar(imageName: 'dataSending.json', height: 200, size: 200,);
            } 
            else {
              bool isCurrentUser = currentUserId ==
                  snapshot.data!.tDirectMessage!.sendUserId!.toInt();
              var alignment =
                  isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
              final directMessages = snapshot.data;
              int messageLength =
                  directMessages!.tDirectThreads!.length.toInt();
              int firstPerson =
                  directMessages.tDirectMessage!.receiveUserId!.toInt();
              int secondPerson =
                  directMessages.tDirectMessage!.sendUserId!.toInt();
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: messageLength,
                      itemBuilder: (context, index) {
                        String message = directMessages
                            .tDirectThreads![index].directthreadmsg
                            .toString();
                        return ListTile(
                          title: Container(
                              alignment: alignment,
                              child: Column(
                                crossAxisAlignment: isCurrentUser
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  ChatBubble(
                                      message: message,
                                      isCurrentUser: isCurrentUser)
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              controller: messageTextController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              cursorColor: kPrimaryColor,
                              decoration: const InputDecoration(
                                  hintText: "Type Messages",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: Icon(Icons.message),
                                  ))),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          margin: const EdgeInsets.only(right: 25),
                          child: IconButton(
                            onPressed: () async {
                              sendThread();
                            },
                            icon: const Icon(
                              Icons.send_outlined,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
