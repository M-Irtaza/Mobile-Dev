import 'package:flutter/material.dart';
import 'package:lab07/components/login_screen.dart';
import 'package:lab07/components/profile_screen.dart';
import 'package:lab07/components/utab_navigation.dart';
import 'package:lab07/components/btab_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        ProfileScreen.route: (context) => ProfileScreen(),
        UtabNavigation.route: (context) => UtabNavigation(),
        BtabNavigation.route: (context) => BtabNavigation(),
      },
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      //home: LoginScreen(),
    );
  }
}
