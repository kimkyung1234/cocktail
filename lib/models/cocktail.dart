class Cocktail {
  Cocktail({
    this.drinks,
  });
  List<Drink>? drinks;

  factory Cocktail.fromJson(Map<String, dynamic> json) => Cocktail(
        drinks: List<Drink>.from(json['drinks'].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'drinks': List<dynamic>.from(drinks!.map((x) => x.toJson())),
      };
}

class Drink {
  Drink(
      {this.strDrink,
      this.strIBA,
      this.strGlass,
      this.strInstructions,
      this.strDrinkThumb,
      this.idDrink,
      this.strCategory});
  String? strDrink;
  String? strIBA;
  String? strGlass;
  String? strInstructions;
  String? strDrinkThumb;
  String? idDrink;
  String? strCategory;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        strDrink: json['strDrink'],
        strIBA: json['strIBA'],
        strGlass: json['strGlass'],
        strInstructions: json['strInstructions'],
        strDrinkThumb: json['strDrinkThumb'],
        idDrink: json['idDrink'],
        strCategory: json['strCategory'],
      );

  Map<String, dynamic> toJson() => {
        'strDrink': strDrink ?? 'No data',
        'strIBA': strIBA ?? 'No data',
        'strGlass': strGlass ?? 'No data',
        'strInstructions': strInstructions ?? 'No data',
        'strDrinkThumb': strDrinkThumb ??
            'https://i.picsum.photos/id/870/200/300.jpg?blur=2&grayscale&hmac=ujRymp644uYVjdKJM7kyLDSsrqNSMVRPnGU99cKl6Vs',
        'idDrink': idDrink ?? 'No data',
        'strCategory': strCategory ?? 'No data'
      };
}
