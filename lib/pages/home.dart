import 'package:cocktail/providers/page.dart';
import 'package:cocktail/services/style.dart';
import 'package:cocktail/widgets/cocktail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    Column(children: [
      const SizedBox(height: 130),
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
      CocktailCardWidget(),
    ]),
    const Center(
      child: Text('Search'),
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
