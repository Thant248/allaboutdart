import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/starlistsService/star_lists_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class GroupStarWidget extends StatefulWidget {
  const GroupStarWidget({Key? key}) : super(key: key);

  @override
  State<GroupStarWidget> createState() => _GroupStarState();
}

class _GroupStarState extends State<GroupStarWidget> {
  StarListService starListService = StarListService();

  late Future<void> _refreshFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshFuture = _fetchData();
  }

  Future<void> _fetchData() async {
    await starListService.starList();
  }

  Future<void> _refresh() async {
    setState(() {
      _refreshFuture = _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: starListService.starList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressionBar(
                  imageName: 'loading.json',
                  height: 200,
                  size: 200,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.data!.groupStar == null ||
                  snapshot.data!.groupStar!.isEmpty) {
                return LiquidPullToRefresh(
                  onRefresh: _refresh,
                  color: Colors.blue.shade100,
                  animSpeedFactor: 200,
                  showChildOpacityTransition: true,
                  child: Scaffold(
                    body: const ProgressionBar(
                      imageName: 'nodatahasFounded.json',
                      height: 200,
                      size: 200,
                    ),
                  ),
                );
              } else {
                return LiquidPullToRefresh(
                  onRefresh: _refresh,
                  color: Colors.blue.shade100,
                  animSpeedFactor: 200,
                  showChildOpacityTransition: true,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.groupStar!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data!.groupStar![index].name
                                .toString();
                            String groupmsg = snapshot
                                .data!.groupStar![index].groupmsg
                                .toString();
                            String channelName = snapshot
                                .data!.groupStar![index].channelName
                                .toString();
                            String dateFormat = snapshot
                                .data!.groupStar![index].createdAt
                                .toString();
                            DateTime dateTime = DateTime.parse(dateFormat);
                            String time =
                                DateFormat('yyyy-MM-dd').format(dateTime);
                            return Card(
                              color: Colors.blueGrey,
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.brown.shade400,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border(
                                          top: BorderSide(color: Colors.white),
                                          bottom:
                                              BorderSide(color: Colors.white))),
                                  child: Center(
                                    child: Text(
                                      name.characters.first.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  groupmsg,
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(time,
                                    style: TextStyle(color: Colors.white)),
                                trailing: Text(
                                  channelName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
