import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/mentionlistsService/mention_lists_service.dart';

class GroupMessages extends StatefulWidget {
  const GroupMessages({super.key});

  @override
  State<GroupMessages> createState() => _GroupMessageState();
}

class _GroupMessageState extends State<GroupMessages> {
  MentionListsService mentionListsService = MentionListsService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: mentionListsService.mentionList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressionBar(
                  imageName: 'loading.json', height: 200, size: 200,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.data!.groupMessage == null ||
                  snapshot.data!.groupMessage!.isEmpty) {
                return const ProgressionBar(imageName: 'dataSending.json', height: 200, size: 200,);
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.groupMessage!.length,
                        itemBuilder: (context, index) {
                          final mentionItem = snapshot.data!.groupMessage![index];
                          String dateFormat = mentionItem.createdAt.toString();
                          DateTime dateTime = DateTime.parse(dateFormat);
                          String time = DateFormat('yyyy-MM-dd').format(dateTime);
                          return ListTile(
                            title: Text(
                               '${mentionItem.name?? ''}\n${mentionItem.groupmsg ?? ''}\n${mentionItem.channelName?? ''}\n$time',
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
