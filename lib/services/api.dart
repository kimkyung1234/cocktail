import 'dart:convert';

import 'package:cocktail/models/cocktail.dart';
import 'package:http/http.dart';

Future<Cocktail> getCocktailData() async {
  final response = await get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'));
  if (response.statusCode == 200) {
    return Cocktail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}

Future<Cocktail> getCocktailDataById({required String id}) async {
  final response = await get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id'));
  if (response.statusCode == 200) {
    return Cocktail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}

Future<Cocktail> getCocktailDataByInputText({required String inputText}) async {
  final response = await get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$inputText'));
  if (response.statusCode == 200) {
    return Cocktail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading news");
  }
}
