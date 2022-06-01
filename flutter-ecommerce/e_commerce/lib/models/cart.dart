import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String? id;
  final String? name;
  final int? quantity;
  final double? price;

  CartItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String product_id, String name, double price) {
    if (_items.containsKey(product_id)) {
      _items.update(
          product_id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity! + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          product_id,
          () => CartItem(
              id: DateTime.now().toString(),
              name: name,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if ((_items[id]?.quantity ?? 0) > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity! - 1,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
