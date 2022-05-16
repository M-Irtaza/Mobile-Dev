import 'package:flutter/material.dart';
import 'package:lab07/components/login_screen.dart';
import 'package:lab07/components/profile_screen.dart';
import 'package:lab07/components/utab_navigation.dart';
import 'package:lab07/components/btab_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

Future<bool> isRemebered() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool _isRemebered = (prefs.getBool('remember_me') ?? false);
  print(_isRemebered);
  return _isRemebered;
}

String mem() {
  if (isRemebered() == true) {
    print("home");
    return "home";
  } else {
    print("intro");
    return "intro";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "intro": (context) => LoginScreen(),
        "home": (context) => ProfileScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        ProfileScreen.route: (context) => ProfileScreen(),
        UtabNavigation.route: (context) => UtabNavigation(),
        BtabNavigation.route: (context) => BtabNavigation(),
      },
      initialRoute: mem(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      //home: LoginScreen(),
    );
  }
}
