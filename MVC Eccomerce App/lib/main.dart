import 'package:flutter/material.dart';
import './components/login_screen.dart';
import './components/cart_screen.dart';
import 'package:provider/provider.dart';
import './components/products.dart';
import './providers/cart.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Cart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        CartScreen.route: (context) => const CartScreen(),
        Products.route: (context) => const Products(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
