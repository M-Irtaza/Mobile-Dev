import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart.dart';

class ProductView extends StatefulWidget {
  final Product product;
  const ProductView({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Image.network(widget.product.imageUrl, width: 50, height: 50),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(widget.product.name),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  context.read<Cart>().add(widget.product);
                  setState(() {
                    _added = true;
                  });
                },
                child: _added
                    ? const Icon(Icons.check, color: Colors.grey)
                    : const Text('ADD',
                        style: TextStyle(
                          color: Colors.black,
                        ))),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
