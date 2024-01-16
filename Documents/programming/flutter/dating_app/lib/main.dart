import 'package:dating_app/photo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DateApp());
}

class DateApp extends StatelessWidget {
  const DateApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Photo() ,
      
    ); 
  }
}
