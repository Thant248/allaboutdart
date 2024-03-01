import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/screens/Mention/MentionWidget/group_mention.dart';
import 'package:flutter_frontend/screens/Mention/MentionWidget/group_thread_mention.dart';
import 'package:flutter_frontend/screens/home/workspacehome.dart';

class MentionBody extends StatefulWidget {
  const MentionBody({Key? key}) : super(key: key);

  @override
  State<MentionBody> createState() => _MentionBodyState();
}

class _MentionBodyState extends State<MentionBody> {
  int? isSelected;
  static List<Widget> pages = [
    const GroupMessages(),
    const GroupThreads(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mention Groups"),
        backgroundColor: kPriamrybackground,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text("Group Message"),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                      onPressed: () {
                        setState(() {
                          isSelected = 2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text("Group Thread"),
                      )),
                )
              ],
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
