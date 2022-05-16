import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab9/model/model.dart';
import 'package:http/http.dart' as http;

class api extends StatefulWidget {
  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  late Future<todos> futuretodos;

  @override
  void initState() {
    super.initState();
    futuretodos = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<todos>(
            future: futuretodos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final mytodos = snapshot.data! as String;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text(mytodos),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class TaskView extends StatelessWidget {
  final todos task;
  const TaskView({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('ID :',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 20,
                ),
                Text('${task.id}'),
              ],
            ),
            Row(
              children: [
                Text('Title :',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 15,
                ),
                Flexible(child: Text(task.title)),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      )
    ]);
  }
}
