import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/dataInsert/mention_list.dart';
import 'package:flutter_frontend/services/mentionlistsService/mention_list.service.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:dio/dio.dart';

class GroupMessages extends StatefulWidget {
  const GroupMessages({super.key});

  @override
  State<GroupMessages> createState() => _GroupMessageState();
}

class _GroupMessageState extends State<GroupMessages> {
  var snapshot = MentionStore.mentionList;
  final _mentionListService = MentionListService(Dio());
  late Future<void> _refreshFuture;

 int userId = SessionStore.sessionData!.currentUser!.id!.toInt();
  @override
  void initState() {
    super.initState();
    // _refreshFuture = _fetchData();
  }

  Future<void> _fetchData() async {
    var token = await getToken();
    await _mentionListService.getAllMentionList(userId, token!);
  }

  Future<void> _refresh() async {
    setState(() {
      _refreshFuture = _fetchData();
    });
  }

  Future<String?> getToken() async {
    return await AuthController().getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: LiquidPullToRefresh(
                  onRefresh: _refresh,
                  color: Colors.blue.shade100,
                  animSpeedFactor: 100,
                  showChildOpacityTransition: true,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot!.groupMessage!.length,
                          itemBuilder: (context, index) {
                            String dateFormat = snapshot!
                                .groupMessage![index].createdAt
                                .toString();
                            DateTime dateTime = DateTime.parse(dateFormat);
                            String time =
                                DateFormat('yyyy-MM-dd').format(dateTime);
                            String name =
                                snapshot!.groupMessage![index].name.toString();
                            String groupmsg = snapshot!
                                .groupMessage![index].groupmsg
                                .toString();
                            String channelName = snapshot!
                                .groupMessage![index].channelName
                                .toString();
                            return Card(
                              color: Colors.blueGrey,
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.brown.shade400,
                                      borderRadius: BorderRadius.circular(25),
                                      border: const Border(
                                        top: BorderSide(color: Colors.white),
                                        bottom: BorderSide(color: Colors.white),
                                      )),
                                  child: Center(
                                      child: Text(
                                    name.characters.first.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                ),
                                title: Text(
                                  groupmsg,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  time,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: Text(
                                  channelName,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
