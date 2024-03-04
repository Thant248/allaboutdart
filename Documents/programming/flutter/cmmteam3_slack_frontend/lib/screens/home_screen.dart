import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.message),
        backgroundColor: Colors.lightBlue,
        title: Text('Slack App'),
      ),
    );
  }
}
