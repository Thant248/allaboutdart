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
                  imageName: 'loading.json', height: 200, size: 200,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.data!.groupStar == null ||
                  snapshot.data!.groupStar!.isEmpty) {
                return const ProgressionBar(imageName: 'dataSending.json', height: 200, size: 200,);
              } else {
                return LiquidPullToRefresh(
                  onRefresh: _refresh,
                  backgroundColor: Colors.lightBlue,
                  animSpeedFactor: 200,
                  showChildOpacityTransition: false,
                  
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.groupStar!.length,
                          itemBuilder: (context, index) {
                            final starItem = snapshot.data!.groupStar![index];
                            String dateFormat = starItem.createdAt.toString();
                            DateTime dateTime = DateTime.parse(dateFormat);
                            String time =
                                DateFormat('yyyy-MM-dd').format(dateTime);
                            return ListTile(
                              title: Text(
                                '${starItem.name ?? ''}\n${starItem.groupmsg ?? ''}\n$time',
                                style: const TextStyle(color: Colors.black),
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
