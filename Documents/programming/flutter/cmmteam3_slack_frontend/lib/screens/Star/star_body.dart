import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/model/MentionLists.dart';
import 'package:flutter_frontend/model/StarLists.dart';
import 'package:flutter_frontend/screens/Star/starsWidget/direct_star.dart';
import 'package:flutter_frontend/screens/Star/starsWidget/direct_thread_star.dart';
import 'package:flutter_frontend/screens/Star/starsWidget/group_star.dart';
import 'package:flutter_frontend/screens/Star/starsWidget/group_thread_star.dart';
import 'package:flutter_frontend/screens/home/workspacehome.dart';

class StarBody extends StatefulWidget {
  const StarBody({Key? key}) : super(key: key);

  @override
  State<StarBody> createState() => _StarBodyState();
}

class _StarBodyState extends State<StarBody> {
  int? isSelected = 1;
  static List<Widget> pages = [
    
  const DirectStars(),
  const DirectThreadStars(),
  const GroupStarWidget(),
  const GroupThreadStar()
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stars Groups"),
        backgroundColor: kPriamrybackground, // Corrected typo here
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WorkHome()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [Icon(Icons.star)],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilledButton(
                  onPressed: () {
                    setState(() {
                      isSelected = 1;
                    });
                  },
                  child: const Text("Direct Star"),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      isSelected = 2;
                    });
                  },
                  child: const Text("Direct Thread Star"),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      isSelected = 3;
                    });
                  },
                  child: const Text("Group Star"),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      isSelected = 4;
                    });
                  },
                  child: const Text("Group Thread Star"),
                ),
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
