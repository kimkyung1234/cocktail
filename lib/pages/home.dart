import 'package:cocktail/providers/page.dart';
import 'package:cocktail/widgets/cocktail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    Center(
      child: CocktailCardWidget(),
    ),
    Center(
      child: Text('Search'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pages>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(128, 0, 32, 1),
      body: Center(
        child: _children[provider.getCurrentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color.fromRGBO(128, 0, 32, 1),
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
