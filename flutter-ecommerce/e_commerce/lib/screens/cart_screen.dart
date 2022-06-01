import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.purpleAccent],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
        ),
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: 30,
            //color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) {
                  return CartProduct(
                      id: cart.items.values.toList()[i].id,
                      productId: cart.items.keys.toList()[i],
                      name: cart.items.values.toList()[i].name,
                      quantity: cart.items.values.toList()[i].quantity,
                      price: cart.items.values.toList()[i].price);
                }),
          ),
          CheckoutButton(cart: cart)
        ],
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart? cart;
  const CheckoutButton({required this.cart});
  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.purpleAccent),
        child: Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: (widget.cart?.totalAmount ?? 0) <= 0
            ? null
            : () async {
                await Provider.of<Orders>(context, listen: false).addOrder(
                    widget.cart!.items.values.toList(),
                    widget.cart!.totalAmount);
                widget.cart!.clear();
              });
  }
}
