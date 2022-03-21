import 'package:cocktail/providers/page.dart';
import 'package:cocktail/services/style.dart';
import 'package:cocktail/widgets/cocktail_card.dart';
import 'package:cocktail/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    Column(
      children: [
        const SizedBox(height: 120),
        flexibleText(
          text: 'Cocktails',
          textColor: Colors.white,
          padding: const EdgeInsets.only(left: 30),
          alignment: Alignment.topLeft,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
        const SizedBox(height: 30),
        CocktailCardWidget(),
      ],
    ),
    Column(
      children: [
        const SizedBox(height: 120),
        flexibleText(
          text: 'Search',
          textColor: Colors.white,
          padding: const EdgeInsets.only(left: 30),
          alignment: Alignment.topLeft,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);

    return Scaffold(
      backgroundColor: Style.background,
      body: Center(
        child: _children[provider.getCurrentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Style.background,
        onTap: provider.onTabTapped,
        currentIndex: provider.getCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }
}
