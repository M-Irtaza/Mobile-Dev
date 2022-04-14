import 'dart:developer';

import 'package:flutter/material.dart';

class CountState extends InheritedWidget {
  final int counter;
  final Widget child;
  final Function incrementCounter;
  final Function decrementCounter;

  const CountState(
      {Key? key,
      required this.counter,
      required this.child,
      required this.incrementCounter,
      required this.decrementCounter})
      : super(key: key, child: child);

  static CountState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CountState>()!);
  }

  @override
  bool updateShouldNotify(CountState oldWidget) {
    //return true;
    return counter != oldWidget.counter;
  }
}
