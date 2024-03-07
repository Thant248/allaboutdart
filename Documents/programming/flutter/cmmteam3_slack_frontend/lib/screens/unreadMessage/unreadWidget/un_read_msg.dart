import 'package:flutter/material.dart';

import 'package:flutter_frontend/model/dataInsert/unread_list.dart';

import 'package:intl/intl.dart';

class unReadDirectMsg extends StatefulWidget {
  const unReadDirectMsg({Key? key}) : super(key: key);

  @override
  State<unReadDirectMsg> createState() => _unReadDirectMsgState();
}

class _unReadDirectMsgState extends State<unReadDirectMsg> {
  var snapshot = UnreadStore.unreadMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: snapshot!.unreadDirectMsg!.length,
                            itemBuilder: (context, index) {
                              String d_message_name = snapshot!
                                  .unreadDirectMsg![index].name
                                  .toString();
                              String d_message = snapshot!
                                  .unreadDirectMsg![index].directmsg
                                  .toString();
                              String d_message_t = snapshot!
                                  .unreadDirectMsg![index].created_at
                                  .toString();
                              DateTime time = DateTime.parse(d_message_t);
                              String created_at =
                                  DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .format(time);
                              return ListTile(
                                leading: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.amber,
                                    child: Center(
                                        child: Text(
                                      d_message_name.characters.first,
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ))),
                                title: Row(
                                  children: [
                                    Text(
                                      d_message_name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      created_at,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(143, 0, 0, 0)),
                                    )
                                  ],
                                ),
                                subtitle: Text(d_message),
                                //  trailing: IconButton(onPressed: (){print(dMessageStar);}, icon: Icon(Icons.star)),
                                // trailing: dMessageStar.isEmpty ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
                              );
                            })),
                  ],
                ))));
  }
}
