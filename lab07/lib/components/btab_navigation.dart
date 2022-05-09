import 'package:flutter/material.dart';

class BtabNavigation extends StatefulWidget {
  static const route = '/BtabNavigation';

  State<StatefulWidget> createState() => _btab_navigation_state();
}

class _btab_navigation_state extends State<BtabNavigation> {
  int _selectedIndex = 0;

  static const _pages = ["My First Page", "My Second Page", "My Third Page"];
  static const _colour = [0xFF18FFFF, 0xFF64FFDA, 0xFFB2FF59];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Bar Navigation"),
      ),
      body: Container(
        color: Color(_colour.elementAt(_selectedIndex)),
        child: Center(
          child: Text(
            _pages.elementAt(_selectedIndex),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
