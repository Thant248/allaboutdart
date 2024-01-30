import 'package:flutter/material.dart';

class PreFerences extends StatefulWidget {
  const PreFerences({super.key});

  @override
  State<PreFerences> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PreFerences> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Center(
        child:   TextButton(onPressed: () => Navigator.pop(context) , child:  Text('PreFerences')),
      ),
    );
  }
}