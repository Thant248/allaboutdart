import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/screens/home_screen.dart';
import 'package:flutter_frontend/screens/memverinvite/member_invite.dart';
import 'package:flutter_frontend/services/mChannelService/m_channel_services.dart';

class GroupMessage extends StatefulWidget {
  final int channelID;
  const GroupMessage({Key? key, required this.channelID}) : super(key: key);

  @override
  State<GroupMessage> createState() => _GroupMessageState();
}

class _GroupMessageState extends State<GroupMessage> {
  late String channelName;

  @override
  void initState() {
    super.initState();
    channelName = SessionStore
        .sessionData!.mChannels![widget.channelID].channelName
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          channelName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimarybtnColor,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  MChannelServices().deleteChannel(16);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
      body: InkWell(
        onTap: () => const HomeScreen(),
        child:const  Padding(
          padding:  EdgeInsets.all(80),
          child:  Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(''),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mouseCursor: MaterialStateMouseCursor.textable,
        child: const Icon(Icons.people_alt_sharp),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MemberInvitation(),
            ),
          );
        },
      ),
      backgroundColor: kPriamrybackground,
    );
  }
}
