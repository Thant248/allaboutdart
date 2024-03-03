import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/directMessage/chat_buble.dart';
import 'package:flutter_frontend/services/directMessage/direct_message_api.dart';

class DirectMessageWidget extends StatefulWidget {
  final int userId;
  final String receiverName;

  const DirectMessageWidget({
    Key? key,
    required this.userId,
    required this.receiverName,
  }) : super(key: key);

  @override
  State<DirectMessageWidget> createState() => _DirectMessageWidgetState();
}

class _DirectMessageWidgetState extends State<DirectMessageWidget> {
  final DirectMessageService directMessageService = DirectMessageService();
  final TextEditingController messageTextController = TextEditingController();
  String? currentUserName;
  late final StreamController<DirectMessages> _controller;
  late Timer _timer;

  _DirectMessageWidgetState()
      : _controller = StreamController<DirectMessages>();

  @override
  void initState() {
    super.initState();

    fetchMessages();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.close();
    super.dispose();
  }

  void fetchMessages() {
    directMessageService
        .getAllDirectMessages(widget.userId)
        .listen((directMessages) {
      _controller.add(directMessages);
    });

    // Fetch messages periodically
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      directMessageService
          .getAllDirectMessages(widget.userId)
          .listen((directMessages) {
        _controller.add(directMessages);
      });
    });
  }

  Future<void> sendMessage() async {
    if (messageTextController.text.isNotEmpty) {
      await directMessageService.sendDirectMessage(
          widget.userId, messageTextController.text);
      messageTextController.clear();
    }
  }

  Future<void> sendThread() async {
    if (messageTextController.text.isNotEmpty) {
      await directMessageService.sendDirectMessageThread(
          1, widget.userId, messageTextController.text);
      messageTextController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Nav()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.lightBlue,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  widget.receiverName.isNotEmpty
                      ? "${widget.receiverName.characters.first.toUpperCase()}"
                      : "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.receiverName}",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Active 3m ago",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
      body: StreamBuilder(
        stream: _controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            return ProgressionBar(
              imageName: 'dataSending.json',
              height: 200,
              size: 200,
            );
          } else {
            final directMessages = snapshot.data!;
            final isCurrentUser = currentUserName ==
                directMessages
                    .tDirectMessages![snapshot.data!.tDirectMessages!.length]
                    .name;
            final alignment = isCurrentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start;
            final directThreads = directMessages.tDirectMessages!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: directThreads.length,
                    itemBuilder: (context, index) {
                      final message = directThreads[index].directmsg!;
                      return ListTile(
                        title: Container(
                          alignment: isCurrentUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: alignment,
                            children: [
                              ChatBubble(
                                message: message,
                                isCurrentUser: isCurrentUser,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: messageTextController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.send,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: "Type Messages",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.message),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          sendMessage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          margin: EdgeInsets.only(right: 25),
                          child: Icon(
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
      ),
    );
  }
}
