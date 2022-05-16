import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class todos {
  final int id;
  final String title;

  const todos(this.id, this.title);

  factory todos.fromJson(Map<String, dynamic> json) {
    return todos(
      json['id'],
      json['title'],
    );
  }
}

Future<todos> fetchData() async {
  String productURl = 'https://jsonplaceholder.typicode.com/todos';
  final response = await http.get(Uri.parse(productURl),
      headers: {"Content-Type": "application/json"});
  final jsonResponse = todos.fromJson(jsonDecode(response.body));

  if (response.statusCode == 200) {
    return jsonResponse;
  } else {
    throw Exception('Failed to load album');
  }
}
