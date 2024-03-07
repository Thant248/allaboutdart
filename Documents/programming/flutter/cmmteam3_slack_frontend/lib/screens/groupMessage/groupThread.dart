// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/group_thread_list.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/groupThreadApi/groupThreadService.dart';
import 'package:intl/intl.dart';
class GpThreadMessage extends StatefulWidget {
  String? name,fname,time,message,channelName;
  int? messageID,channelID;
  final channelStatus;
  GpThreadMessage({super.key,this.name,this.fname,this.time,this.message,this.messageID,this.channelID,this.channelStatus,this.channelName});

  @override
  State<GpThreadMessage> createState() => _GpThreadMessageState();
}

class _GpThreadMessageState extends State<GpThreadMessage> {
   TextEditingController threadMessage = TextEditingController();

    GroupThreadMessage GroupThreadList = GroupThreadMessage();
    String? GroupThread;
    void _sendGpThread() async {
      String message = threadMessage.text;
      int? channel_id = widget.channelID;
      await GpThreadMsg().sendGroupThreadData(message, channel_id!, widget.messageID!);
      if(message.isEmpty){
        setState(() {
          GroupThread = message;
        });
      }
      print("GroupThreads : $GroupThread");
      threadMessage.text = "";
    }

  @override
  Widget build(BuildContext context) {
    dynamic channel = widget.channelStatus? "public"
                                    :"private";

    
    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: navColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
          title: Column(
            children: [
              ListTile(
                title: Text("Message",style: TextStyle(color: Colors.white),),
                subtitle: Text("${channel} : ${widget.channelName}",style: TextStyle(color: Colors.white)),
              ),
              
            ],
          ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("${widget.fname}",style: TextStyle(color: Colors.white,fontSize: 30),)),
            ),
            title: Text("${widget.name}"),
            subtitle: Text("${widget.time}"),
          ),
          ListTile(
                leading: Text("${widget.message}",),
              ),
              const Divider(),        
         SingleChildScrollView(
           child: Container(
            height: MediaQuery.of(context).size.height*0.6,
            child: FutureBuilder(
              future: GpThreadMsg().fetchGpThread(widget.messageID!,widget.channelID!),
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
                    snapshot.data!.GpThreads == null ||
                    snapshot.data!.GpThreads!.isEmpty) {
                  return const ProgressionBar(imageName: 'dataSending.json',height: 200,
                  size: 200);
                } else {
                  return Column(
                    children: [
                         SingleChildScrollView(
                           child: Container(
                            height: MediaQuery.of(context).size.height*0.5,
                             child: ListView.builder(
                              itemCount: snapshot.data!.GpThreads!.length,
                              itemBuilder: (context, index) {
                              String message =snapshot.data!.GpThreads![index].groupthreadmsg.toString();
                              String name = snapshot.data!.GpThreads![index].name.toString();
                              String time = snapshot.data!.GpThreads![index].created_at.toString();
                              DateTime date = DateTime.parse(time);
                              String created_at = DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
                              return Padding(
                              padding: EdgeInsets.only(left: 20,right: 20,top: 6,bottom: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                ),
                                child: ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.brown.shade900,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(child: Text(name.characters.first.toUpperCase(),
                                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),),
                                    
                                  ),
                                  title: Column(
                                    children: [
                                      ListTile(
                                        title: Text(message,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                        subtitle: Text(created_at),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                                                     );
                               
                              },
                                                     ),
                           ),
                         ),
                      
                    ],
                  );
                }
              },
            ),
                   ),
         ),
        ]
      ),
      
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: TextField(

                  controller: threadMessage,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Send Threads",
                    focusColor: Colors.grey.shade100,
                    prefixIcon: GestureDetector(
                      onTap: (){
                        _sendGpThread();
                      },
                      child: Icon(Icons.telegram_sharp,size: 30,),
                    )
                  ),
              ),)
            ],
          ),
        ),
        ),

  );
  }
}