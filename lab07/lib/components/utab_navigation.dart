import 'package:flutter/material.dart';

class UtabNavigation extends StatefulWidget {
  static const route = '/UtabNavigation';

  State<StatefulWidget> createState() => _utab_navigation_state();
}

class _utab_navigation_state extends State<UtabNavigation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              text: "LEFT",
            ),
            Tab(
              text: "MIDDLE",
            ),
            Tab(
              text: "RIGHT",
            ),
          ]),
          title: Text("Top Bar Navigation"),
        ),
        body: const TabBarView(children: [
          Center(
            child: Text(
              "This is the left tab",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "This is the middle tab",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "This is the right tab",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ]),
      ),
    );
  }
}
