import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import './product_view.dart';
import './cart_screen.dart';

class Products extends StatefulWidget {
  static const route = '/products';
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late Future<List<Product>> products;

  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);
      return (jsonResponse as List).map((e) => Product.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      products = fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.route);
            },
            icon: const Icon(Icons.shopping_cart_checkout_outlined),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductView(product: products[index]);
                    }),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
