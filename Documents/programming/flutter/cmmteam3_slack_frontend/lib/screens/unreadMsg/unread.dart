// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/screens/unreadMsg/unread_api_service.dart';

class unreadMessage extends StatefulWidget {
  const unreadMessage({super.key});

  @override
  State<unreadMessage> createState() => _unreadMessageState();
}

class _unreadMessageState extends State<unreadMessage> {
  @override
  Widget build(BuildContext context) {
    unreadApi UnreadApi = unreadApi();
    return  Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: navColor,
          title: Text("Unread Messages",style: TextStyle(color: kPrimaryTextColor),),
      ),
      body: Column(
        children: [
          //-------------Unread Direct Message -----------------
          SingleChildScrollView(
            child: Container(
              child: ExpansionTile(
                title:Text("Unread Direct Messages"),
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/5,
                    child: FutureBuilder(
                      future: UnreadApi.unreadList(),
                      builder: ((context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        else if(snapshot.hasError){
                          return Text("Error : ${snapshot.error}");
                        }
                        else if(!snapshot.hasData){
                          return Text("No data avialable");
                        }
                        else{
                          return Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height/5,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.unreadDirectMsg!.length,
                                  itemBuilder: (context,index){
                                    String d_message_name = snapshot.data!.unreadDirectMsg![index].name.toString();
                                        String d_message = snapshot.data!.unreadDirectMsg![index].directmsg.toString();
                                        String d_message_t = snapshot.data!.unreadDirectMsg![index].created_at.toString();                            
                                        return 
                                             ListTile(
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                color: Colors.amber,
                                                child: Center(child: Text(d_message_name.characters.first,
                                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
                                                ),
                                              title: Row(
                                                children: [
                                                  Text(d_message_name,style: TextStyle(fontWeight: FontWeight.bold),),
                                                  SizedBox(width: 20,),
                                                  Text(d_message_t,style: TextStyle(fontSize: 10,color: Color.fromARGB(143, 0, 0, 0)),)
                                                ],
                                              ),
                                              subtitle: Text(d_message),
                                              //  trailing: IconButton(onPressed: (){print(dMessageStar);}, icon: Icon(Icons.star)),
                                              // trailing: dMessageStar.isEmpty ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
                                            );
                                  }),
                              ),
                              
                            ],
                          );
                        }
                      }),
                    ),
                  ),
                ],
                 ),
            ),
          ),
          //---------------------Unread direct message threads
          SingleChildScrollView(
            child: Container(
              child: ExpansionTile(
                title:Text("Unread Direct Threads"),
                children: [
                  Container(
                     height: MediaQuery.of(context).size.height/5,
                    child: FutureBuilder(
                      future: UnreadApi.unreadList(),
                      builder: ((context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        else if(snapshot.hasError){
                          return Text("Error : ${snapshot.error}");
                        }
                        else if(!snapshot.hasData){
                          return Text("No data avialable");
                        }
                        else{
                          return Column(
                            children: [
                              Container(
                                 height: MediaQuery.of(context).size.height/5,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.unreadThreads!.length,
                                  itemBuilder: (context,index){
                                    String d_message_name = snapshot.data!.unreadThreads![index].name.toString();
                                        String d_message = snapshot.data!.unreadThreads![index].directthreadmsg.toString();
                                        String d_message_t = snapshot.data!.unreadThreads![index].created_at.toString();                            
                                        return 
                                             ListTile(
                                              leading: Container(
                                                height: 40,
                                                width: 40,
                                                color: Colors.amber,
                                                child: Center(child: Text(d_message_name.characters.first,
                                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
                                                ),
                                              title: Row(
                                                children: [
                                                  Text(d_message_name,style: TextStyle(fontWeight: FontWeight.bold),),
                                                  SizedBox(width: 20,),
                                                  Text(d_message_t,style: TextStyle(fontSize: 10,color: Color.fromARGB(143, 0, 0, 0)),)
                                                ],
                                              ),
                                              subtitle: Text(d_message),
                                              //  trailing: IconButton(onPressed: (){print(dMessageStar);}, icon: Icon(Icons.star)),
                                              // trailing: dMessageStar.isEmpty ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
                                            );
                                  }),
                              ),
                              
                            ],
                          );
                        }
                      }),
                    ),
                  ),
                ],
                 ),
            ),
          ),
           //-----------------Unread Group Message-------------------
           SingleChildScrollView(
            child: Container(
              child: ExpansionTile(
                title:Text("Unread Group Messages"),
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    child: FutureBuilder(
                      future: UnreadApi.unreadList(),
                      builder: ((context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        else if(snapshot.hasError){
                          return Text("Error : ${snapshot.error}");
                        }
                        else if(!snapshot.hasData){
                          return Text("No data avialable");
                        }
                        else{
                          return Column(
                            children: [
                              Container(
                                 height: MediaQuery.of(context).size.height/3,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.unreadGpMsg!.length,
                                  itemBuilder: (context,index){
                                        String name = snapshot.data!.unreadGpMsg![index].name.toString();
                                        String c_name = snapshot.data!.unreadGpMsg![index].channel_name.toString();
                                        // String count = snapshot.data!.unreadGpMsg![index].count.toString();
                                        String gp_message = snapshot.data!.unreadGpMsg![index].groupmsg.toString();
                                        String gp_message_t = snapshot.data!.unreadGpMsg![index].created_at.toString();                            
                                        return 
                                             Column(
                                               children: [
                                                 ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    color: Colors.amber,
                                                    child: Center(child: Text(name.characters.first,
                                                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
                                                    ),
                                                  title: Row(
                                                    children: [
                                                      Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                                                      SizedBox(width: 20,),
                                                      Text(gp_message_t,style: TextStyle(fontSize: 10,color: Color.fromARGB(143, 0, 0, 0)),)
                                                    ],
                                                  ),
                                                  subtitle: Text(gp_message),
                                                  trailing: Text("channal: $c_name"),
                                                
                                                  //  trailing: IconButton(onPressed: (){print(dMessageStar);}, icon: Icon(Icons.star)),
                                                  // trailing: dMessageStar.isEmpty ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
                                                                                             ),
                                               ],
                                               
                                             );
                                  }),
                              ),
                            ],
                          );
                        }
                      }),
                    ),
                  ),
                ],
                 ),
            ),
          ),

        ],
      ),
    );
  }
}