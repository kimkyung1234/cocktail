import 'package:cocktail/models/cocktail.dart';
import 'package:cocktail/services/api.dart';
import 'package:cocktail/services/style.dart';
import 'package:cocktail/widgets/common.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Detail View',
          style: TextStyle(color: Colors.white),
        ),
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
              data?.strCategory != null
                  ? flexibleText(
                      text: 'Category : ${data?.strCategory}',
                      fontSize: 13,
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      alignment: Alignment.topLeft,
                    )
                  : const SizedBox(),
              flexibleText(
                text: data?.strInstructions ?? 'No data',
                padding: const EdgeInsets.all(10),
              ),
            ],
          );
        },
      ),
    );
  }
}
