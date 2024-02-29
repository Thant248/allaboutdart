import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/services/starlistsService/star_lists_service.dart';


class StarLists extends StatefulWidget {
  const StarLists({Key? key}) : super(key: key);

  @override
  State<StarLists> createState() => _StarListsState();
}

class _StarListsState extends State<StarLists> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StarListService starListService = StarListService();
    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 84, 236),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text(
          "Star Lists",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [ExpansionTile(
                  title: const Text("Direct Star Lists",style: TextStyle(color: Colors.white,fontSize: 18)),
                  children: [Container(
                    height: 150,
                    child: FutureBuilder(
                    future: starListService.starList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return Text('No data available');
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.directStar!.length,
                          itemBuilder: (context, index) {
                            final starItem = snapshot.data!.directStar![index];
                            return ListTile(
                              title: Text(
                              '${starItem.name ?? ''}\n${starItem.directmsg?? ''}\n${starItem.createdAt ?? ''}',
                               style: TextStyle(color: Colors.black,fontSize: 15),
                              ),
                              trailing: Icon(Icons.star),
                            );
                          },
                        );
                      }
                    },
                  ),
                  )],
                  ),
              
              ExpansionTile(
                  title: const Text("Direct Star Thread",style: TextStyle(color: Colors.white,fontSize: 18)),
                  children: [Container(
                  height: 100,
                  child: FutureBuilder(
                  future: starListService.starList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Text('No data available');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.directStarThread!.length,
                        itemBuilder: (context, index) {
                          final starItem = snapshot.data!.directStarThread![index];
                          return ListTile(
                            title: Text(
                              '${starItem.name ?? ''}\n${starItem.directthreadmsg?? ''}\n${starItem.createdAt ?? ''}',
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Icon(Icons.star),
                          );
                        },
                      );
                    }
                  },
                ),
                  
          
                )],
                  
                  ),
          
              ExpansionTile(
                  title: const Text("Group Star",style: TextStyle(color: Colors.white)),
                  children: [Container(
                  height: 100,
                  child: FutureBuilder(
                  future: starListService.starList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Text('No data available');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.groupStar!.length,
                        itemBuilder: (context, index) {
                          final starItem = snapshot.data!.groupStar![index];
                          return ListTile(
                            title: Text(
                              '${starItem.name ?? ''}\n${starItem.groupmsg?? ''}\n${starItem.channelName ?? ''}\n${starItem.createdAt ?? ''}',
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),     
                            trailing: Icon(Icons.star),
                          );
                        },
                      );
                    }
                  },
                ),
                  
          
                )],
                  
                  ),
              ExpansionTile(
                  title: const Text("Group Star Thread",style: TextStyle(color: Colors.white,fontSize: 18)),
                  children: [Container(
                  height: 100,
                  child: FutureBuilder(
                  future: starListService.starList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Text('No data available');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.groupStarThread!.length,
                        itemBuilder: (context, index) {
                          final starItem = snapshot.data!.groupStarThread![index];
                          return ListTile(
                            title: Text(
                              '${starItem.name ?? ''}\n${starItem.groupthreadmsg?? ''}\n${starItem.channelName ?? ''}\n${starItem.createdAt ?? ''}',
                             
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                            trailing: Icon(Icons.star),
                          );
                        },
                      );
                    }
                  },
                ),
                  
          
                )],
                  
                  ),
          
          ],
          ),
        ),
      )

    );
  }
}
