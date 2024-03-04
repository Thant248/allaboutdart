import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionState.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';

class DirectMessage extends StatefulWidget {
  const DirectMessage({super.key});

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  @override
  Widget build(BuildContext context) {
    AuthController controller = AuthController();
    return FutureBuilder(
        future: controller.mainPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No data available');
          } else {
            SessionData data = snapshot.data!;
            // String currentName = data.currentUser!.name.toString();
            // int channelLength = data.mChannels!.length;
            int workSpaceUserLength = data.mUsers!.length;
            return Scaffold(
              backgroundColor: kPriamrybackground,
              appBar: AppBar(
                backgroundColor: navColor,
                title: Text("Direct Messages",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                actions: [
                  
                  IconButton(onPressed: (){
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DirectMessage()),
                          );
                  }, icon: Tooltip(
                    message: 'add member',
                    child: Icon(Icons.add,color: Colors.white,)))
                ],
              ),
              body: Container(
                  child: Column(
                    children: [
                     
                        SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.6,
                            child: ListView.builder(
                              itemCount: workSpaceUserLength,
                              itemBuilder: (context, index) {
                                String userName = data.mUsers![index].name.toString();
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: ListTile(
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            userName.characters.first.toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        userName,
                                        style:
                                            const TextStyle(color: kPrimaryTextColor),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      
                      
                    ],
                  ),
                ),
              
            );
          }
        });
  }
}
