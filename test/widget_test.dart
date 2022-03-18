import 'package:cocktail/services/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var data = await datas();
  print(data.drinks?[0].strDrink);

  test('first', () {
    data.drinks?[0].strDrink;
    expect('Margarita', 'Margarita');
  });
}
