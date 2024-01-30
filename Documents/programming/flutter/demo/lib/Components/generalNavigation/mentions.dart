import 'package:demo/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class Mentions extends StatelessWidget {
  const Mentions({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Mentions & Reactions",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/mentions.jpg", // Make sure the image path is correct
                height: 100,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Never Miss A Beat",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Slack can give you a ping whenever a teammate mentions you by a name. So you stay connected, no matter where you are",
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
            ),
            // Add additional paragraphs or widgets as needed
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigate(),
    );
  }
}
