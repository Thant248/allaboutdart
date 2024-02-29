// ignore_for_file: prefer_const_constructors

import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/groupMessage.dart';
import 'package:flutter_frontend/services/groupMessageService.dart/group_message_service.dart';
enum SampleItem { itemOne, itemTwo, itemThree }

class groupMessage extends StatefulWidget {
  const groupMessage({super.key});

  @override
  State<groupMessage> createState() => _groupMessageState();
}

class _groupMessageState extends State<groupMessage> {
  final TextEditingController _sendMessageController = TextEditingController();
  String? GroupMessageName;
  void _groupMessageSend() async {
    String messageText = _sendMessageController.text;
    int channel_id= 5;
   await sendGroupMessageData(messageText , channel_id);
    if (messageText.isNotEmpty) {
      setState(() {
        GroupMessageName = messageText;
      });
    }
    print(" GroupMessageName");
    print( GroupMessageName);
  }
  
  
  groupMessageData ? _getUserDetails;

   @override
  void initState() {
    super.initState();
    fetchUserDetailsUpdate();
    print("fetchUserDetailsUpdate");
    print(fetchUserDetailsUpdate);
    
  }
  Future<groupMessageData?> fetchUserDetailsUpdate() async {
    _getUserDetails = await fetchAlbum();

    setState(() {
       channelName = _getUserDetails!.mChannel!.channelName.toString();
       memberCount =  _getUserDetails!.retrieveGroupMessage!.uCount;
      //  Member
    });
    
    print("_channelName");
    print(channelName);
  }
   String? channelName;
   int? memberCount; 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kPriamrybackground,
      appBar: AppBar(
        backgroundColor: navColor,
        leading: Icon(Icons.arrow_back),
        title: Column(
          children: [
            Text("$channelName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("$memberCount,members",style: TextStyle(fontSize: 10,color: Colors.white),)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.white,))
        ],

      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.6,
            child: FutureBuilder<groupMessageData?>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                groupMessageData groupMessageList = snapshot.data!;
                int groupMessageLength = groupMessageList.retrieveGroupMessage!.tGroupMessages!.length.toInt();
                print("groupMessageLength");
                print(groupMessageLength);
               
                // print("SnapshotData");
                // print(groupMessage.mChannel!.channelName.toString());
                return Container(
                  child: ListView.builder(
                    itemCount: groupMessageLength,
                    itemBuilder: (BuildContext context, int index) {
                      
                      SampleItem? selectedItem;
                      String name = groupMessageList.retrieveGroupMessage!.tGroupMessages![index].name.toString();
                      return ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(child: Text(name.characters.first.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),))),
                        title: Text(groupMessageList.retrieveGroupMessage!.tGroupMessages![index].groupmsg.toString()),
                         trailing:  PopupMenuButton<SampleItem>(
                              initialValue: selectedItem,
                              onSelected: (SampleItem item) {
                                setState(() {
                                  selectedItem = item;
                                });
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                                  PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemOne,
                                  onTap: (){
                                  
                                  },
                                    child: ListTile(
                                      leading: Icon(Icons.star),
                                      title:Text("Star")
                                    ),
                                  
                                ),
                                   
                                   PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemTwo,
                                    onTap: () {
                                      // Navigator.push(context, MaterialPageRoute(
                                      //   builder: (context)=>GpThreadMessage(name: name.characters.first.toUpperCase(),)));
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.reply),
                                      title: Text('Threads'),
                                    )
                                  ),
                                                      const PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemThree,
                                    child: ListTile(
                                      leading: Icon(Icons.delete),
                                      title: Text('delete'),
                                    ),
                                  ),
                                  ]                     ,
                              ),
                                            );
                                          },
                                        ),
                                    ); 
              }
              else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },),
          ),  
        //  ListTile(
        //     leading: Text("$GroupMessageName"),
        //     title: Text("$GroupMessageName"),
        //     trailing:  IconButton(
        //               icon:  Icon(Icons.more_vert),
        //               onPressed: () {},
        //   ),
        //   )  
        // if (GroupMessageName != null) 
        // ListTile(
        //   leading: Text("$GroupMessageName"),
        //   title: Text("$GroupMessageName"),
        //   trailing:  IconButton(
        //     icon:  Icon(Icons.more_vert),
        //     onPressed: () {},
        //   ),
        // ) 
        ],
      ),
      

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 50.0,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _sendMessageController,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              TextButton(
                onPressed: () {
                  _groupMessageSend();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}