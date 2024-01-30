import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:   TextButton(onPressed: () => Navigator.pop(context) , child:  Text('Search')),
      ),
    );
  }
}