import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/directMessage/chat_buble.dart';
import 'package:flutter_frontend/services/directMessage/direct_message_api.dart';

import 'package:dio/dio.dart';
import 'package:flutter_frontend/services/directMessage/retrofit/direct_meessages.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';

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

class _DirectMessageWidgetState extends State<DirectMessageWidget>
    with RouteAware {
  final DirectMessageService directMessageService = DirectMessageService();
  final TextEditingController messageTextController = TextEditingController();
  String currentUserName =
      SessionStore.sessionData!.currentUser!.name.toString();
  StreamController<DirectMessages> _controller =
      StreamController<DirectMessages>();

  final _apiService = ApiService(Dio());

  bool isLoading = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.close();
    messageTextController.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _startTimer(); // Restart the timer when returning to this page
  }

  void _startTimer() async {
    if (!isLoading) {
      _timer = Timer.periodic(const Duration(seconds: 6), (timer) async {
        try {
          
          final token = await getToken();
         DirectMessages directMessages =  await _apiService.getAllDirectMessages(widget.userId, token!);
          _controller.add(directMessages);
        } catch (e) {
          print("Error fetching messages: $e");
        }
      });
    }
  }

  Future<void> sendMessage() async {
    if (messageTextController.text.isNotEmpty) {
      await directMessageService.sendDirectMessage(
          widget.userId, messageTextController.text);
      messageTextController.clear();
    }
  }

  Future<String?> getToken() async {
    return await AuthController().getToken();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState() {
              isLoading = !isLoading;
            }

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Nav()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.lightBlue,
        title: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
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
      body: StreamBuilder<DirectMessages>(
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
            int directMessage = directMessages.tDirectMessages!.length.toInt();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: directMessage,
                    itemBuilder: (context, index) {
                      String message = directMessages
                          .tDirectMessages![index].directmsg!
                          .toString();
                      bool isMessageFromCurrentUser = currentUserName ==
                          directMessages.tDirectMessages![index].name;
                      final alignment = isMessageFromCurrentUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start;

                      return ListTile(
                        title: Container(
                          alignment: isMessageFromCurrentUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: alignment,
                            children: [
                              ChatBubble(
                                message: message,
                                isCurrentUser: isMessageFromCurrentUser,
                              ),
                            ],
                          ),
                        ),
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
                      GestureDetector(
                        onTap: () {
                          setState() {
                            isLoading = !isLoading;
                          }

                          sendMessage();
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
              ],
            );
          }
        },
      ),
    );
  }
}
