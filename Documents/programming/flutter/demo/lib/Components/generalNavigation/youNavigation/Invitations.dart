import 'package:flutter/material.dart';

class Invitations extends StatefulWidget {
  const Invitations({super.key});

  @override
  State<Invitations> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Invitations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Invitations')),
      ),
    );
  }
}
