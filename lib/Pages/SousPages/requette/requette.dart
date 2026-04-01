import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;





Future<List<dynamic>> fetchpost({required String mobile}) async {
  String private = '561a1b0307574c86a596ce23c1800c29';

  final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=$mobile&lang=fr&max=10&apikey=$private'));

  if (response.statusCode == 200){
    final data = json.decode(response.body);
    return data['articles'];
  } else {
    throw Exception('Erreur API');
  }

}