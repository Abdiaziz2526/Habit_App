import 'package:flutter/material.dart';
import 'package:habbit_app/Screens/Screen.dart';
import 'package:habbit_app/Screens/Settings/setting_screen.dart';
import 'package:habbit_app/Screens/Statitics/Statitics.dart';
import 'package:habbit_app/Screens/habits/Screen/habit.dart';
import 'package:habbit_app/Widgets/app_Colors.dart';
import 'package:iconly/iconly.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({super.key});

  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  // Index for the currently selected tab
  int _selectedIndex = 0;

  // List of pages corresponding to the navigation items
  final List<Widget> _pages = [
    HomeScreen(), // Replace with your actual Home screen widget
    HomeHabit(), // Your Habits screen widget
    StaticsScreen(), // Your Statistics screen widget
    SettingScreen(), // Your Settings screen widget
  ];

  // Function to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.shield_done),
            label: 'Habits',
          ),
          BottomNavigationBarItem(
            icon: Icon( IconlyLight.chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.setting),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}




