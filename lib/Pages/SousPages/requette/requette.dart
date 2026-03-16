import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;





Future<List<dynamic>> fetchpost({required String mobile}) async {
  String private = 'cbbd3453ef14ec3c9c9f6a571b5d2f24';

  final response = await http.get(Uri.parse('https://gnews.io/api/v4/search?q=$mobile&lang=fr&max=10&apikey=$private'));

  if (response.statusCode == 200){
    final data = json.decode(response.body);
    return data['articles'];
  } else {
    throw Exception('Erreur API');
  }

}