import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cart.dart';
import 'package:flutter/material.dart';

class OrderItem {
  final String? id;
  final double? amount;
  final List<CartItem>? product;
  final DateTime? dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.product,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = "https://ishop-6f8ba-default-rtdb.firebaseio.com/orders.json";
    final timestamp = DateTime.now();
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'id': DateTime.now().toString(),
            'amount': total,
            'dateTime': timestamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.name,
                      'quantity': cp.quantity,
                      'price': cp.price,
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          OrderItem(
              id: json.decode(response.body)['name'],
              amount: total,
              product: cartProducts,
              dateTime: timestamp));
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
