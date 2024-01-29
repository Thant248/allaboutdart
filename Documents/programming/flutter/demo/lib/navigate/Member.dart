import 'package:demo/home.dart';
import 'package:flutter/material.dart';

class Member extends StatelessWidget {
  const Member({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(name: 'Member', bodyname: 'This is Member Page',);
  }
}
