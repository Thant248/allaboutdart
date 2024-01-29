import 'package:demo/home.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(name: 'Admin',  bodyname: 'This is Admin Page',);
  }
}
