import 'package:cocktail/models/cocktail.dart';
import 'package:cocktail/services/api.dart';
import 'package:cocktail/services/style.dart';
import 'package:cocktail/widgets/common.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String inputText;
  const ResultPage({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Result',
          style: TextStyle(color: Colors.white),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(),
        ),
      ),
      body: FutureBuilder<Cocktail>(
        future: getCocktailDataByInputText(inputText: inputText),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            padding: const EdgeInsets.all(18),
            itemCount: snapshot.data?.drinks?.length ?? 0,
            itemBuilder: (_, index) {
              final data = snapshot.data?.drinks?[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 130,
                child: Row(
                  children: [
                    carryImageWidget(
                      url: data?.strDrinkThumb ?? '',
                      boxFit: BoxFit.fill,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        flexibleText(text: data?.strDrink ?? ''),
                        flexibleText(
                          text: data?.strCategory ?? '',
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
