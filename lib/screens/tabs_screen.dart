import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': Categories(), 'title': 'Categories'},
    {'page': Favorites(), 'title': 'Favorites'},
  ];
  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return //DefaultTabController(
        //length: 2,
        //child:
        Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[selectedPageIndex]['title'],
        ),
        // bottom: TabBar(
        //labelStyle: Theme.of(context).textTheme.bodyText2,
        //tabs: [
        //Tab(
        //icon: Icon(Icons.category),
        //text: 'Categories',
        //),
        //Tab(
        //icon: Icon(Icons.star),
        //text: 'Favorites',
        //),
        //],
        //),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
      //TabBarView(
      // children: [
      // Categories(),
      //Favorites(),
      //],
    );
    //  );
    //  );
  }
}
