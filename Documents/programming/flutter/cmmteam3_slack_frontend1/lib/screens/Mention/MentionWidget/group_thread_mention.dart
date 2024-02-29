import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/mentionlistsService/mention_lists_service.dart';

class GroupThreads extends StatefulWidget {
  const GroupThreads({super.key});

  @override
  State<GroupThreads> createState() => _GroupThreadState();
}

class _GroupThreadState extends State<GroupThreads> {
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
              } else if (snapshot.data!.groupThread == null ||
                  snapshot.data!.groupThread!.isEmpty) {
                return const ProgressionBar(imageName: 'dataSending.json', height: 200, size: 200,);
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.groupThread!.length,
                        itemBuilder: (context, index) {
                          final mentionItem = snapshot.data!.groupThread![index];
                          String dateFormat = mentionItem.createdAt.toString();
                          DateTime dateTime = DateTime.parse(dateFormat);
                          String time = DateFormat('yyyy-MM-dd').format(dateTime);
                          return ListTile(
                            title: Text(
                               '${mentionItem.name?? ''}\n${mentionItem.groupthreadmsg ?? ''}\n${mentionItem.channelName?? ''}\n$time',
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