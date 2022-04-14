import 'package:flutter/material.dart';
import '../models/product.dart';

class Cart with ChangeNotifier {
  final List<Product> _cartProducts = [];
  double _totalPrice = 0.0;

  List<Product> get cartProducts => _cartProducts;

  double get totalPrice => _totalPrice;

  void add(Product prod) {
    _cartProducts.add(prod);
    _totalPrice += prod.price;
    notifyListeners();
  }
}
