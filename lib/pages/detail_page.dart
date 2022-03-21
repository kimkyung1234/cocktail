import 'package:cocktail/models/cocktail.dart';
import 'package:cocktail/services/api.dart';
import 'package:cocktail/services/style.dart';
import 'package:cocktail/widgets/common.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(),
        ),
      ),
      body: FutureBuilder<Cocktail>(
        future: getCocktailDataById(id: id),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data?.drinks?[0];
          return ListView(
            children: [
              carryImageWidget(
                url: data?.strDrinkThumb ?? '',
                boxFit: BoxFit.fill,
                radius: 0,
              ),
              // Text(data?.strDrink ?? ''),
            ],
          );
        },
      ),
    );
  }
}
