import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Lab 05 - Task 03'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.blue,
        margin: const EdgeInsets.all(10.0),
        padding: EdgeInsets.all(30.0),
        child: Container(
            color: Colors.yellow,
            child: Column(
              children: [
                Container(
                  color: Colors.green,
                  height: 250,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "T",
                            style: TextStyle(fontSize: 72.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Icon(
                            Icons.star,
                            size: 72.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    "T",
                    style: TextStyle(fontSize: 72.0),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
