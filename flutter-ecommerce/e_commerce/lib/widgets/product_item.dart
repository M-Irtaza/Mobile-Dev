import 'package:e_commerce/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/products.dart';

class ProductItem extends StatelessWidget {
  final String? name;
  final String? imgUrl;

  ProductItem({
    this.name,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: product.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          child: Image.network(imgUrl!),
          footer: GridTileBar(
            title: Text(
              name!,
              style: TextStyle(fontSize: 12),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 50),
                    content: Text("Item Added to Cart")));
                cart.addItem(product.id!, product.name!, product.price!);
              },
            ),
            backgroundColor: Colors.purpleAccent,
          ),
        ),
      ),
    );
  }
}
