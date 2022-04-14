import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const route = '/cart-screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: context.watch<Cart>().cartProducts.length,
                  itemBuilder: (ctx, index) => Row(
                    children: [
                      const Icon(Icons.circle, size: 5),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          '${context.watch<Cart>().cartProducts[index].name}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${context.watch<Cart>().totalPrice}',
                    style: const TextStyle(
                        fontSize: 60, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        'BUY',
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
