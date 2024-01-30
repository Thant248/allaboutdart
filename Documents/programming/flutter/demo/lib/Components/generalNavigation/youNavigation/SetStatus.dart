import 'package:flutter/material.dart';

class SetStatus extends StatefulWidget {
  const SetStatus({super.key});

  @override
  State<SetStatus> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SetStatus> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Center(
        child:   TextButton(onPressed: () => Navigator.pop(context) , child:  Text('Status')),
      ),
    );
  }
}