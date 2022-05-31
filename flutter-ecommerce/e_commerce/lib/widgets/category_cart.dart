import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Icon? icon;
  final String? name;

  CategoryCard({this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              icon!,
              const SizedBox(
                height: 12,
              ),
              Text(
                name!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
