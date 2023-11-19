import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'lap_calculator_page.dart';
import 'fuel_calculator_page.dart'; // Import your Fuel Calculator page here

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.title});
  final String title;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    LapCalculatorPage(),
    FuelCalculatorPage(),
    // Add more pages here
  ];

  final List<String> _titles = [
    'Lap Calculator',
    'Fuel Calculator',
    // Add more titles here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  SizedBox getBottomNavigationBar() {
    return SizedBox(
      height:
          kIsWeb ? 90 : (Platform.isAndroid ? kBottomNavigationBarHeight : 90),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Laps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: 'Fuel',
          ),
        ],
        selectedItemColor: Theme.of(context)
            .colorScheme
            .inversePrimary, // set the selected item color to the secondary color of the current theme
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Update the current index when an item is tapped
          });
        },
      ),
    );
  }
}
