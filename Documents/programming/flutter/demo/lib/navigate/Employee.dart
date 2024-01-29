import 'package:demo/home.dart';
import 'package:flutter/material.dart';

class Employee extends StatelessWidget {
  const Employee({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(name: 'Employee', bodyname: 'This is Employee Page',);
  }
}
