import 'package:flutter/material.dart';
import 'package:widget_tree/inherited_Counter.dart';
import 'CounterProvider.dart';

class CounterPage extends StatefulWidget {
  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int counter = 0;
  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
    if (counter == 1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Can\'t decrement further. Lower limit reached.')));
    }
  }

  void incrementCounter() {
    if (counter < 10) {
      setState(() {
        counter++;
      });
    }
    if (counter == 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Can\'t increment further. Upper Limit reached')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CountState(
        counter: counter,
        child: InheritedCounter(),
        incrementCounter: incrementCounter,
        decrementCounter: decrementCounter);
  }
}
