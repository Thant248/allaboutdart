import 'package:flutter/material.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/unreadMessages/unread_message_service.dart';
import 'package:intl/intl.dart';

class unReadDirectGp extends StatefulWidget {
  const unReadDirectGp({Key? key}) : super(key: key);

  @override
  State<unReadDirectGp> createState() => _unReadDirectGpState();
}

class _unReadDirectGpState extends State<unReadDirectGp> {
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
                  imageName: 'loading.json',
                  height: 200,
                  size: 200,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.data == null ||
                  snapshot.data!.unreadGpMsg == null ||
                  snapshot.data!.unreadGpMsg!.isEmpty) {
                return const ProgressionBar(
                  imageName: 'dataSending.json',
                  height: 200,
                  size: 200,
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.unreadGpMsg!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot
                                .data!.unreadGpMsg![index].name
                                .toString();
                            String c_name = snapshot
                                .data!.unreadGpMsg![index].channel_name
                                .toString();
                            // String count = snapshot.data!.unreadGpMsg![index].count.toString();
                            String gp_message = snapshot
                                .data!.unreadGpMsg![index].groupmsg
                                .toString();
                            String gp_message_t = snapshot
                                .data!.unreadGpMsg![index].created_at
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
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  title: Row(
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        created_at,
                                        style: TextStyle(
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
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
