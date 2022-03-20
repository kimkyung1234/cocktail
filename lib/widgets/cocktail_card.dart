import 'package:cocktail/models/cocktail.dart';
import 'package:cocktail/services/api.dart';
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
              const SizedBox(height: 140),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 500, // card height
                child: PageView.builder(
                  itemCount: snapshot.data?.drinks?.length ?? 0,
                  controller: PageController(viewportFraction: 0.7),
                  itemBuilder: (_, index) {
                    final data = snapshot.data?.drinks?[index];
                    return Transform.scale(
                      scale: 0.9,
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            data?.strDrink ?? 'No data',
                            //style: const TextStyle(fontSize: 32),
                          ),
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
