import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
      body: Center(
        child:   TextButton(onPressed: () => Navigator.pop(context) , child:  Text('Notifications')),
      ),
    );
  }
}