import 'package:cocktail/models/cocktail.dart';
import 'package:cocktail/pages/detail_page.dart';
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
          } else if (snapshot.data?.drinks?.length == null) {
            return Center(
                child: flexibleText(
              text: 'No data',
              fontWeight: FontWeight.bold,
            ));
          }
          print('${snapshot.data?.drinks?.length}');
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            padding: const EdgeInsets.all(18),
            itemCount: snapshot.data?.drinks?.length ?? 0,
            itemBuilder: (_, index) {
              final data = snapshot.data?.drinks?[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        id: data?.idDrink ?? '',
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 130,
                  child: Row(
                    children: <Widget>[
                      carryImageWidget(
                        url: data?.strDrinkThumb ?? '',
                        boxFit: BoxFit.scaleDown,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            flexibleText(
                              text: data?.strDrink ?? '',
                              alignment: Alignment.topLeft,
                              overflow: TextOverflow.ellipsis,
                            ),
                            flexibleText(
                              text: data?.strCategory ?? '',
                              fontSize: 14,
                              alignment: Alignment.topLeft,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
