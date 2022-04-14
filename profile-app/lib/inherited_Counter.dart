import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_tree/CounterProvider.dart';
import 'CounterPage.dart';

class InheritedCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterState = CountState.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'You have pushed the button ${counterState.counter} times'),
                  Text(
                    '${counterState.counter}',
                    style: TextStyle(
                      fontSize: 64.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          counterState.counter <= 1
                              ? null
                              : () => counterState.decrementCounter;
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          counterState.counter <= 1
                              ? null
                              : () => counterState.incrementCounter;
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterState.counter <= 1
              ? null
              : () => counterState.incrementCounter;
        },
        backgroundColor: Colors.green,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _show(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
              title: const Text('!!!ALERT!!!'),
              content: const Text(
                  'You can not use the counter. Counter range : 1 to 10'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Close'))
              ],
            ));
  }
}
