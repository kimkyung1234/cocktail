import 'package:cocktail/services/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var data = await getCocktailData();
  print(data.drinks?[0].strDrink);
  print(data.drinks?[0].idDrink);

  test('first', () {
    expect('155 Belmont', data.drinks?[0].strDrink);
  });

  test('id check', () {
    expect('15346', data.drinks?[0].idDrink);
  });
}
