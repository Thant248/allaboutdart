import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/screens/home/workspacehome.dart';
import 'package:flutter_frontend/screens/unreadMessage/unreadWidget/un_read_gp.dart';
import 'package:flutter_frontend/screens/unreadMessage/unreadWidget/un_read_msg.dart';
import 'package:flutter_frontend/screens/unreadMessage/unreadWidget/un_read_thread.dart';

class unreadMessage extends StatefulWidget {
  const unreadMessage ({Key? key}) : super(key: key);

  @override
  State<unreadMessage> createState() => _unreadMessageState();
}

class _unreadMessageState extends State<unreadMessage> {
  int? isSelected;
  static List<Widget> pages = [
    
    const unReadDirectMsg(),
    const unReadDirectThread(),
    const unReadDirectGp()
  ];

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        backgroundColor: kPriamrybackground,
      appBar: AppBar(
        title: const Text("Thread List",style: TextStyle(color: Colors.white),),
        backgroundColor: navColor, // Corrected typo here
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          isSelected = 1;
                        });
                      },
                       style: ButtonStyle(
                        backgroundColor:isSelected==1 ? 
                        MaterialStateProperty.all<Color>(navColor):
                        MaterialStateProperty.all<Color>(kPrimarybtnColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text("Unread Direct Message",style: TextStyle(fontSize: 17)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          isSelected = 2;
                        });
                      },
                       style: ButtonStyle(
                        backgroundColor:isSelected==2 ? 
                        MaterialStateProperty.all<Color>(navColor):
                        MaterialStateProperty.all<Color>(kPrimarybtnColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text("Unread Direct Threads",style: TextStyle(fontSize: 17),),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          isSelected = 3;
                        });
                      },
                       style: ButtonStyle(
                        backgroundColor:isSelected==3 ? 
                        MaterialStateProperty.all<Color>(navColor):
                        MaterialStateProperty.all<Color>(kPrimarybtnColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text("Unread Group Message",style: TextStyle(fontSize: 17)),
                      ),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
          if (isSelected != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: pages[isSelected! - 1],
              ),
            )
        ],
      ),
    );
  }
}