

import 'package:flutter/material.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/unreadMessages/unread_message_service.dart';
import 'package:intl/intl.dart';
class unReadDirectMsg extends StatefulWidget {
  const unReadDirectMsg({Key? key}) : super(key: key);

  @override
  State<unReadDirectMsg> createState() => _unReadDirectMsgState();
}

class _unReadDirectMsgState extends State<unReadDirectMsg> {
  UnreadApi unRead = UnreadApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: unRead.unreadList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressionBar(
                  imageName: 'loading.json', height: 200, size: 200,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.data == null ||
                  snapshot.data!.unreadDirectMsg == null ||
                  snapshot.data!.unreadDirectMsg!.isEmpty) {
                return const ProgressionBar(imageName: 'dataSending.json', height: 200, size: 200,);
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                                  itemCount: snapshot.data!.unreadDirectMsg!.length,
                                  itemBuilder: (context,index){
                                    String d_message_name = snapshot.data!.unreadDirectMsg![index].name.toString();
                                        String d_message = snapshot.data!.unreadDirectMsg![index].directmsg.toString();
                                        String d_message_t = snapshot.data!.unreadDirectMsg![index].created_at.toString();   
                                        DateTime time = DateTime.parse(d_message_t);
                                        String created_at = DateFormat('yyyy-MM-dd HH:mm:ss').format(time);                         
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
                                                  Text(created_at,style: TextStyle(fontSize: 10,color: Color.fromARGB(143, 0, 0, 0)),)
                                                ],
                                              ),
                                              subtitle: Text(d_message),
                                              //  trailing: IconButton(onPressed: (){print(dMessageStar);}, icon: Icon(Icons.star)),
                                              // trailing: dMessageStar.isEmpty ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
                                            );
                                  })
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}