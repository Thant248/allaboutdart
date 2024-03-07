import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/screens/Navigation/Dm.dart';
import 'package:flutter_frontend/screens/Navigation/profle.dart';
import 'package:flutter_frontend/screens/home/workspacehome.dart';
 
class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  static const List<Widget> _page = [
      WorkHome(),
      DirectMessage(),
      profile()
  ];
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Color.fromARGB(255, 246, 255, 255),
        color: const Color.fromARGB(255, 63, 189, 248),
        animationDuration: Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: _onItemTapped,
        items: [
        Icon(Icons.home),
        Icon(Icons.message),
        Icon(Icons.person)
      ]),
    );
  }
}