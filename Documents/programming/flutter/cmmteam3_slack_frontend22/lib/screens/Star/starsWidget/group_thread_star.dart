import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/starlistsService/star_lists_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class GroupThreadStar extends StatefulWidget {
  const GroupThreadStar({super.key});

  @override
  State<GroupThreadStar> createState() => _GroupThreadStarState();
}

class _GroupThreadStarState extends State<GroupThreadStar> {
  StarListService starListService = StarListService();

  late Future<void> _refreshFuture;
  
  @override
  void initState(){
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
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: starListService.starList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ProgressionBar(
                    imageName: 'loading.json',height: 200,
                  size: 200,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.hasError}'),
                  );
                } else if (snapshot.data!.directStar! == null ||
                    snapshot.data!.directStarThread!.isEmpty) {
                  return const ProgressionBar(imageName: 'dataSending.json',height: 200,
                  size: 200,);
                } else {
                  return LiquidPullToRefresh(
                    onRefresh: _refresh,
                    color: Colors.blue.shade100,
                    animSpeedFactor: 100,
                    showChildOpacityTransition: true,
                    child: Column(children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.groupStarThread!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data!.groupStarThread![index].name.toString();
                            String groupthreadmsg = snapshot.data!.groupStarThread![index].groupthreadmsg.toString();
                            String channelName = snapshot.data!.groupStarThread![index].channelName.toString();
                            String dateFormat = snapshot.data!.groupStarThread![index].createdAt.toString();
                            DateTime dateTime = DateTime.parse(dateFormat);
                             String time = DateFormat('yyyy-MM-dd').format(dateTime);
                            return Card(
                              color: Colors.blueGrey,
                              child: ListTile(
                                leading: Container(
                                  height:50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.brown.shade400,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border(
                                      top: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white)
                                    )
                                  ),
                                  child: Center(
                                    child: Text(name.characters.first.toUpperCase(),
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                ),
                                title: Text(groupthreadmsg,style: TextStyle(color: Colors.white),),
                                subtitle: Text(time,style: TextStyle(color: Colors.white),),
                                trailing: Text(channelName,style: TextStyle(fontSize: 15,color:Colors.white),),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
                  );
                }
              },
            )),
      ),
    );
  }
}
