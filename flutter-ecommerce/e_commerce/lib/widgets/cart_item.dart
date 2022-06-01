import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartProduct extends StatelessWidget {
  final String? id;
  final String? productId;
  final double? price;
  final int? quantity;
  final String? name;

  CartProduct({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.purpleAccent,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context).removeItem(productId!);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purpleAccent,
            child: FittedBox(
              child: Text(
                "\$${price}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Text(name!),
          subtitle: Text("Total: \$${price! * quantity!}"),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
