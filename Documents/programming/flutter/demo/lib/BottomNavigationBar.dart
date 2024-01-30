import 'package:demo/Components/generalNavigation/dms.dart';
import 'package:demo/Components/generalNavigation/home.dart';
import 'package:demo/Components/generalNavigation/mentions.dart';
import 'package:demo/Components/generalNavigation/search.dart';
import 'package:demo/Components/generalNavigation/you.dart';
import 'package:flutter/material.dart';

class BottomNavigate extends StatefulWidget {
  const BottomNavigate({super.key});

  @override
  State<BottomNavigate> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNavigate> {
  @override
  Widget build(BuildContext context) {
    int curentPage = 0;
    return NavigationBar(
      selectedIndex: curentPage,
      onDestinationSelected: (int index) {
        setState(() {
          _navigateToPage(context, index);
        });
      },
      destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.message), label: "DMs"),
        NavigationDestination(
            icon: Icon(Icons.alternate_email), label: "Mentions"),
        NavigationDestination(icon: Icon(Icons.search), label: "Search"),
        NavigationDestination(
            icon: Icon(Icons.add_ic_call_sharp), label: "You"),
      ],
    );
  }
}

void _navigateToPage(BuildContext context, int selectedItem) {
  switch (selectedItem) {
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Dms()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Mentions()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Search()),
      );
      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const You()),
      );
      break;

    default:
      throw Exception('Page not found for value: $selectedItem');
  }
}
