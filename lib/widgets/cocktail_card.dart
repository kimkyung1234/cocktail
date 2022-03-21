import 'package:cocktail/models/cocktail.dart';
import 'package:cocktail/pages/detail_page.dart';
import 'package:cocktail/services/api.dart';
import 'package:cocktail/widgets/common.dart';
import 'package:flutter/material.dart';

class CocktailCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Cocktail>(
      future: getCocktailData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: PageView.builder(
                  itemCount: snapshot.data?.drinks?.length ?? 0,
                  controller: PageController(viewportFraction: 0.7),
                  itemBuilder: (_, index) {
                    final data = snapshot.data?.drinks?[index];
                    return Transform.scale(
                      scale: 0.9,
                      child: GestureDetector(
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
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            carryImageWidget(url: data?.strDrinkThumb ?? ''),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  flexibleText(
                                    text: data?.strDrink ?? '',
                                    textColor: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
