import 'dart:convert';

import 'package:cocktail/models/cocktail.dart';
import 'package:http/http.dart';

Future<Cocktail> datas() async {
  final response = await get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'));
  if (response.statusCode == 200) {
    return Cocktail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}