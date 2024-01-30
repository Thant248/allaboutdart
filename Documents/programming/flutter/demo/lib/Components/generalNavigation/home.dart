import 'package:demo/Components/HomeNavigations/AddPeopple.dart';
import 'package:flutter/material.dart';
import 'package:demo/Components/HomeNavigations/AddDescription.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String text =
        "Slack is a messaging app for groups of people who work together. You can send updates, share files, and organize conversations so that everyone is in the loop";
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: "Welcome!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => const AddDescription(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add Description"),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => const AddPeople()),
                      );
                    },
                    icon: const Icon(Icons.man),
                    label: const Text("Add People"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
