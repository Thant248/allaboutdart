import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/services/starlistsService/retrofit/star_list.service.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_frontend/model/dataInsert/star_list.dart';

import 'package:dio/dio.dart';

class DirectStars extends StatefulWidget {
  const DirectStars({Key? key}) : super(key: key);

  @override
  State<DirectStars> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DirectStars> {
  // StarListService starListService = StarListService();

  // ignore: unused_field
  late Future<void> _refreshFuture;

  final _starListService = StarListsService(Dio());

  int userId = SessionStore.sessionData!.currentUser!.id!.toInt();

  var snapshot = StarListStore.starList;

  @override
  void initState() {
    super.initState();
    // _refreshFuture = _fetchData();
  }

  Future<void> _fetchData() async {
    var token = await getToken();
    await _starListService.getAllStarList(userId, token!);
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
        body: LiquidPullToRefresh(
      onRefresh: _refresh,
      color: Colors.blue.shade100,
      animSpeedFactor: 200,
      showChildOpacityTransition: true,
      child: ListView.builder(
        itemCount: snapshot!.directStar!.length,
        itemBuilder: (context, index) {
          String name = snapshot!.directStar![index].name.toString();
          String directmsg = snapshot!.directStar![index].directmsg.toString();
          String dateFormat = snapshot!.directStar![index].createdAt.toString();
          DateTime dateTime = DateTime.parse(dateFormat);
          String time = DateFormat('yyyy-MM-dd').format(dateTime);
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
                  ),
                ),
                child: Center(
                    child: Text(name.characters.first.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
              title: Text(
                directmsg,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                time,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    ));
  }
}
