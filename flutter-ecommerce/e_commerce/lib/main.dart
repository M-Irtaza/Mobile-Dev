import 'package:e_commerce/authScreens/auth_screen.dart';
import 'package:e_commerce/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'mainScreens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}