import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Center(
        child:   TextButton(onPressed: () => Navigator.pop(context) , child:  Text('Pause')),
      ),
    );
  }
}
