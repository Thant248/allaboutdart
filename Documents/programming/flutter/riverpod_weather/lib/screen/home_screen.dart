import 'package:flutter/material.dart';
import 'package:riverpod_weather/screen/weather_screen.dart';
import 'package:riverpod_weather/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  final _destionations = const [
    NavigationDestination(
        icon: Icon(Icons.home_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.home, color: Colors.white,),
        label: ''),
    NavigationDestination(
        icon: Icon(Icons.search_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.search, color: Colors.white,),
        label: ''),
    NavigationDestination(
        icon: Icon(Icons.wb_sunny_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.wb_sunny, color: Colors.white,),
        label: ''),
    NavigationDestination(
        icon: Icon(Icons.settings_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.settings, color: Colors.white,),
        label: ''),
  ];

  final _screen = const [
     WeatherScreen(),
     Center(child: Text('Search Screen'),),
     Center(child: Text('Weather Screen'),),
     Center(child: Text('Settings Screen'),),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: AppColors.secondaryBlack
        ),
        child: NavigationBar(
          destinations: _destionations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
