import 'package:cocktail/services/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var data = await getCocktailData();
  var idData = await getCocktailDataById(id: '11007');
  print(data.drinks?[0].strDrink);
  print(data.drinks?[0].idDrink);

  test('first', () {
    expect(data.drinks?[0].strDrink, '155 Belmont');
  });

  test('id check', () {
    expect(data.drinks?[0].idDrink, '15346');
  });

  test('get data by id', () {
    expect(idData.drinks?[0].strDrink, 'Margarita');
  });
}
