import 'package:demo/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class Dms extends StatelessWidget {
  const Dms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct Messages"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Jump to.....",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 300, 8.0, 8.0),
                child: Image.asset(
                  "images/happy.jpg", // Make sure the image path is correct
                  width: 100, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Slack is Better"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text("Invite people to join your team"),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.people_alt),
                                  label: const Text("Add from Contacts"),
                                ),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.send),
                                    label:
                                        const Text("Add from Google Contacts")),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.mail),
                                    label: const Text("Add from Emails")),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text("Add Teammates")),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigate(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
