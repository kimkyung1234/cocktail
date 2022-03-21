import 'package:cocktail/pages/result_page.dart';
import 'package:cocktail/services/style.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: TextField(
            cursorColor: ColorStyle.background,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    inputText: value,
                  ),
                ),
              );
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              hintText: 'Search',
            ),
          ),
        ),
      ),
    );
  }
}
