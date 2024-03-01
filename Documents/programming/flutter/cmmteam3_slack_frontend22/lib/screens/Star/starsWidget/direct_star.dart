import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/starlistsService/star_lists_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';


class DirectStars extends StatefulWidget {
  const DirectStars({Key? key}) : super(key: key);

  @override
  State<DirectStars> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DirectStars> {
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
                      child: Text('Error : ${snapshot.error}'),
                    );
                  } else if (snapshot.data == null ||
                      snapshot.data!.directStar == null ||
                      snapshot.data!.directStar!.isEmpty) {
                    return const ProgressionBar(imageName: 'dataSending.json',height: 200,
                  size: 200,);
                  } else {
                    return LiquidPullToRefresh(
                    onRefresh: _refresh,
                    color: Colors.blue.shade100,
                     animSpeedFactor: 200,
                     showChildOpacityTransition: true,
                      child:  ListView.builder(
                                itemCount: snapshot.data!.directStar!.length,
                                      itemBuilder: (context, index) {
                                        String name = snapshot.data!.directStar![index].name.toString();
                                        String directmsg = snapshot.data!.directStar![index].directmsg.toString();
                                        String dateFormat = snapshot.data!.directStar![index].createdAt.toString();
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
                                                borderRadius:BorderRadius.circular(25),
                                                border: Border(
                                                top: BorderSide(color: Colors.white),
                                                bottom: BorderSide(color: Colors.white),
                                              ),
                                              ),
                                              child: Center(child: Text(name.characters.first.toUpperCase(),
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white))),
                                            ),
                                            title: Text(directmsg,style: TextStyle(color: Colors.white),),
                                            subtitle: Text(time,style: TextStyle(color: Colors.white),),
                                          ),
                                        );
                                      },
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
  

    