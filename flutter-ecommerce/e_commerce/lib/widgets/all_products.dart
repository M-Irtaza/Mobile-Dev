import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final pdts = productData.getItems();

    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: pdts.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: pdts[i],
            child: ProductItem(
              name: pdts[i].name,
              imgUrl: pdts[i].imgUrl,
            ),
          );
        });
  }
}
