import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/SessionState.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:flutter_frontend/model/SessionStore.dart';


class DirectMessage extends StatefulWidget {
  const DirectMessage({super.key});

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  @override
  Widget build(BuildContext context) {

    int workSpaceUserLength = SessionStore.sessionData!.mUsers!.length;
   
    return
            
          
           Scaffold(
              backgroundColor: kPriamrybackground,
              appBar: AppBar(
                backgroundColor: navColor,
                title: const Text("Direct Messages",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                actions: [
                  
                  IconButton(onPressed: (){
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DirectMessage()),
                          );
                  }, icon: const  Tooltip(
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
                                String userName = SessionStore.sessionData!.mUsers![index].name.toString();
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
  }
  

