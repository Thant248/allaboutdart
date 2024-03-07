import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_frontend/model/dataInsert/thread_lists.dart';

class directThread extends StatefulWidget {
  const directThread({Key? key}) : super(key: key);

  @override
  State<directThread> createState() => _directThreadState();
}

class _directThreadState extends State<directThread> {
  var snapshot = ThreadStore.thread;

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
                          itemCount: snapshot!.d_thread!.length,
                          itemBuilder: (context, index) {
                            String d_thread = snapshot!
                                .d_thread![index].directthreadmsg
                                .toString();
                            String d_thread_name =
                                snapshot!.d_thread![index].name.toString();
                            String d_thread_t = snapshot!
                                .d_thread![index].created_at
                                .toString();
                            DateTime time = DateTime.parse(d_thread_t);
                            String created_at =
                                DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
                            return ListTile(
                              leading: Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(
                                    d_thread_name.characters.first,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ))),
                              title: Row(
                                children: [
                                  Text(
                                    d_thread_name,
                                    style:
                                       const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                const   SizedBox(
                                    width: 20,
                                  ),
                                   Text(created_at,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(143, 0, 0, 0)))
                                ],
                              ),
                              subtitle: Text(d_thread),
                            );
                          }),
                    ),
                  ],
                ))));
  }
}
