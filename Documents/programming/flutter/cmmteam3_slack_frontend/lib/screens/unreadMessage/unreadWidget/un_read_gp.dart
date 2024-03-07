import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/model/dataInsert/unread_list.dart';

class unReadDirectGp extends StatefulWidget {
  const unReadDirectGp({Key? key}) : super(key: key);

  @override
  State<unReadDirectGp> createState() => _unReadDirectGpState();
}

class _unReadDirectGpState extends State<unReadDirectGp> {
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
                          itemCount: snapshot!.unreadGpMsg!.length,
                          itemBuilder: (context, index) {
                            String name =
                                snapshot!.unreadGpMsg![index].name.toString();
                            String c_name = snapshot!
                                .unreadGpMsg![index].channel_name
                                .toString();
                            // String count = snapshot.data!.unreadGpMsg![index].count.toString();
                            String gp_message = snapshot!
                                .unreadGpMsg![index].groupmsg
                                .toString();
                            String gp_message_t = snapshot!
                                .unreadGpMsg![index].created_at
                                .toString();
                            DateTime time = DateTime.parse(gp_message_t);
                            String created_at =
                                DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
                            return Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                      height: 40,
                                      width: 40,
                                      color: Colors.amber,
                                      child: Center(
                                          child: Text(
                                        name.characters.first,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  title: Row(
                                    children: [
                                      Text(
                                        name,
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
                                            color:
                                                Color.fromARGB(143, 0, 0, 0)),
                                      )
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
                ))));
  }
}
