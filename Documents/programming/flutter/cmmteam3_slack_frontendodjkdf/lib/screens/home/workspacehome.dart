// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionState.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/dataInsert/mention_list.dart';
import 'package:flutter_frontend/model/dataInsert/star_list.dart';
import 'package:flutter_frontend/model/dataInsert/thread_lists.dart';
import 'package:flutter_frontend/model/dataInsert/unread_list.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/screens/Mention/mention_body.dart';
import 'package:flutter_frontend/screens/Star/star_body.dart';
import 'package:flutter_frontend/screens/directMessage/direct_message.dart';
import 'package:flutter_frontend/screens/groupMessage/groupMessageTest.dart';
import 'package:flutter_frontend/screens/mChannel/m_channel_create.dart';
import 'package:flutter_frontend/screens/memverinvite/member_invite.dart';
import 'package:flutter_frontend/screens/threadMessage/thread_message.dart';
import 'package:flutter_frontend/screens/unreadMessage/unread_msg.dart';
import 'package:flutter_frontend/screens/userManage/usermanage.dart';
import 'package:flutter_frontend/services/mChannelService/m_channel_services.dart';
import 'package:flutter_frontend/services/mentionlistsService/mention_list.service.dart';
import 'package:flutter_frontend/services/starlistsService/star_list.service.dart';
import 'package:flutter_frontend/services/threadMessages/thread_message_service.dart';
import 'package:flutter_frontend/services/unreadMessages/unread_message_services.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:flutter_frontend/services/userservice/mainpage/mian_page.dart';

import 'package:dio/dio.dart';
import 'package:flutter_frontend/services/userservice/usermanagement/user_management_service.dart';

class WorkHome extends StatefulWidget {
  const WorkHome({Key? key}) : super(key: key);

  @override
  State<WorkHome> createState() => _WorkHomeState();
}

class _WorkHomeState extends State<WorkHome> with RouteAware {
  int? joinId;

  @override
  Widget build(BuildContext context) {
    AuthController controller = AuthController();
    int? directMessageUserID;
    String? directMessageUserName;

    Future<String?> getToken() async {
      return await controller.getToken();
    }

    return FutureBuilder(
      future:
          getToken().then((value) => MainPageService(Dio()).mainPage(value!)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return const ProgressionBar(
            imageName: 'waiting.json',
            height: 500,
            size: 500,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data available');
        } else {
          SessionStore.sessionData = snapshot.data!;
          SessionData data = snapshot.data!;
          String currentName = data.currentUser!.name.toString();
          int channelLength = data.mPChannels!.length;
          int channelLengths = data.mChannels!.length;
          int workSpaceUserLength = data.mUsers!.length;
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 246, 255, 255),
            appBar: AppBar(
              backgroundColor: navColor,
              leading: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  color: Colors.red.shade600,
                  height: 20,
                  width: 20,
                  child: Center(
                    child: Text(
                      currentName.characters.first.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              title: Column(
                children: [
                  Text(
                    currentName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await getThreadMessages();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ThreadList(),
                                ),
                              );
                            },
                            child: const ListTile(
                              leading: Icon(Icons.message_rounded),
                              title: Text(
                                "Threads",
                                style: TextStyle(color: kPrimaryTextColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () async {
                              await getStarLists();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StarBody(),
                                ),
                              );
                            },
                            child: const ListTile(
                              leading: Icon(Icons.star),
                              title: Text(
                                "Stars",
                                style: TextStyle(color: kPrimaryTextColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () async {
                              await getAllUnreadMessages();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const unreadMessage(),
                                ),
                              );
                            },
                            child: const ListTile(
                              leading: Icon(Icons.mail_rounded),
                              title: Text(
                                "Unread Messages",
                                style: TextStyle(color: kPrimaryTextColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () async {
                              await getAllMentionMessages();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MentionBody(),
                                ),
                              );
                            },
                            child: const ListTile(
                              leading: Text(
                                "@",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              title: Text(
                                "Mentions",
                                style: TextStyle(color: kPrimaryTextColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () async {
                              try {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return WillPopScope(
                                        child: Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          backgroundColor: Colors.transparent,
                                          child: const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 32),
                                                child: ProgressionBar(
                                                    imageName: "loading.json",
                                                    height: 150,
                                                    size: 150),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onWillPop: () async => true);
                                  },
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserManagement(),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                  "fail to go userManager",
                                  style: TextStyle(color: Colors.red),
                                )));
                              }
                            },
                            child: const ListTile(
                              leading: Icon(Icons.people),
                              title: Text(
                                "User Manage",
                                style: TextStyle(color: kPrimaryTextColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ExpansionTile(
                                title: const Text(
                                  "Channels",
                                  style: TextStyle(color: kPrimaryTextColor),
                                ),
                                children: [
                                  Container(
                                    height: 150,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: channelLengths,
                                      itemBuilder: (context, index) {
                                        final channel = data.mChannels![index];
                                        var mpChannel = data.mPChannels;
                                        var mChannel = data.mChannels;

                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          groupMessage(
                                                            channelID:
                                                                channel.id,
                                                            channelStatus: channel
                                                                .channelStatus,
                                                            channelName: channel
                                                                .channelName,
                                                          )));
                                            },
                                            child: ListTile(
                                              leading: channel.channelStatus!
                                                  ? const Icon(Icons.tag)
                                                  : const Icon(Icons.lock),
                                              title: Text(
                                                channel.channelName ?? '',
                                                style: const TextStyle(
                                                    color: kPrimaryTextColor),
                                              ),
                                            ));
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 150,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: channelLength,
                                      itemBuilder: (context, index) {
                                        final channel = data.mPChannels![index];
                                        var mpChannel = data.mPChannels;
                                        var mChannel = data.mChannels;

                                        bool isEquals = mChannel!.any((m) =>
                                            m.id == mpChannel![index].id);

                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        groupMessage(
                                                          channelID: channel.id,
                                                          channelStatus: channel
                                                              .channelStatus,
                                                          channelName: channel
                                                              .channelName,
                                                        )));
                                          },
                                          child: ListTile(
                                            leading: channel.channelStatus!
                                                ? const Icon(Icons.tag)
                                                : const Icon(Icons.lock),
                                            title: Text(
                                              channel.channelName ?? '',
                                              style: const TextStyle(
                                                  color: kPrimaryTextColor),
                                            ),
                                            trailing: !isEquals
                                                ? TextButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.yellow)),
                                                    onPressed: () {
                                                      setState(() {
                                                        joinId = data
                                                            .mPChannels![index]
                                                            .id!
                                                            .toInt();
                                                      });

                                                      var response =
                                                          MChannelServices()
                                                              .channelJoin(
                                                                  joinId!);
                                                      response.whenComplete(
                                                          () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const Nav())));
                                                    },
                                                    child:
                                                        const Text('Join ME'))
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MChannelCreate(),
                                        ),
                                      );
                                    },
                                    child: const ListTile(
                                      leading: Icon(Icons.add),
                                      title: Text("Add Channel"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ExpansionTile(
                                title: const Text(
                                  "Direct Messages",
                                  style: TextStyle(color: kPrimaryTextColor),
                                ),
                                children: [
                                  Container(
                                    height: 150,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: workSpaceUserLength,
                                      itemBuilder: (context, index) {
                                        String userName =
                                            data.mUsers![index].name.toString();
                                        int userIds =
                                            data.mUsers![index].id!.toInt();
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                directMessageUserID = userIds;
                                                directMessageUserName =
                                                    userName;
                                              });

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DirectMessageWidget(
                                                    userId:
                                                        directMessageUserID!,
                                                    receiverName:
                                                        directMessageUserName!,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: ListTile(
                                              leading: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    userName.characters.first
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                userName,
                                                style: const TextStyle(
                                                    color: kPrimaryTextColor),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MemberInvitation(),
                                        ),
                                      );
                                    },
                                    child: const ListTile(
                                      leading: Icon(Icons.add),
                                      title: Text("Add Member"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  getStarLists() async {
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();

    try {
      var token = await AuthController().getToken();
      var starListStore =
          await StarListsService(Dio()).getAllStarList(currentUserId, token!);
      StarListStore.starList = starListStore;
    } catch (e) {
      throw e;
    }
  }

  getThreadMessages() async {
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    try {
      var token = await AuthController().getToken();
      var threadListStore =
          await ThreadService(Dio()).getAllThreads(currentUserId, token!);
      ThreadStore.thread = threadListStore;
    } catch (e) {
      throw e;
    }
  }

  getAllUnreadMessages() async {
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    try {
      var token = await AuthController().getToken();
      var unreadListStore = await UnreadMessageService(Dio())
          .getAllUnreadMsg(currentUserId, token!);
      UnreadStore.unreadMsg = unreadListStore;
    } catch (e) {
      throw e;
    }
  }

  getAllMentionMessages() async {
    int currentUserId = SessionStore.sessionData!.currentUser!.id!.toInt();
    try {
      var token = await AuthController().getToken();
      var mentionList = await MentionListService(Dio())
          .getAllMentionList(currentUserId, token!);
      MentionStore.mentionList = mentionList;
    } catch (e) {
      throw e;
    }
  }
}
