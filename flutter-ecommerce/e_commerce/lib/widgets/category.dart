import 'package:e_commerce/widgets/category_cart.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.175,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryCard(
            icon: Icon(
              Icons.book,
              size: MediaQuery.of(context).size.width * 0.20,
            ),
            name: "Book",
          ),
          CategoryCard(
            icon: Icon(
              Icons.computer,
              size: MediaQuery.of(context).size.width * 0.20,
            ),
            name: "Book",
          ),
          CategoryCard(
            icon: Icon(
              Icons.book,
              size: MediaQuery.of(context).size.width * 0.20,
            ),
            name: "Book",
          ),
          CategoryCard(
            icon: Icon(
              Icons.book,
              size: MediaQuery.of(context).size.width * 0.20,
            ),
            name: "Book",
          ),
          CategoryCard(
            icon: Icon(
              Icons.book,
              size: MediaQuery.of(context).size.width * 0.20,
            ),
            name: "Book",
          ),
          CategoryCard(
            icon: Icon(
              Icons.book,
              size: MediaQuery.of(context).size.width * 0.20,
            ),
            name: "Book",
          ),
        ],
      ),
    );
  }
}
