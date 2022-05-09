import 'package:flutter/material.dart';

class BtabNavigation extends StatefulWidget {
  static const route = '/BtabNavigation';

  State<StatefulWidget> createState() => _btab_navigation_state();
}

class _btab_navigation_state extends State<BtabNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Bar Navigation"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
