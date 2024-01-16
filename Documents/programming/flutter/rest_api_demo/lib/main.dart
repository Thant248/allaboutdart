import 'package:flutter/material.dart';
import 'package:rest_api_demo/api/apiService.dart';
import 'package:rest_api_demo/home.dart';
import 'package:dio/dio.dart';

void main(List<String> args) {
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
